deploy_to  = "/home/webmaster/projects/money"
rails_root = "#{deploy_to}/current"
pid_file   = "#{deploy_to}/shared/pids/unicorn.pid"
socket_file= "#{deploy_to}/shared/unicorn.sock"
log_file   = "#{rails_root}/log/unicorn.log"
err_log    = "#{rails_root}/log/unicorn_error.log"
old_pid    = pid_file + '.oldbin'

timeout 180
worker_processes 40 # Здесь тоже в зависимости от нагрузки, погодных условий и текущей фазы луны
#listen socket_file, :backlog => 100
listen 8080, :backlog => 1024, :tcp_nopush => true
pid pid_file
stderr_path err_log
stdout_path log_file

preload_app true # Мастер процесс загружает приложение, перед тем, как плодить рабочие процессы.

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=) # Решительно не уверен, что значит эта строка, но я решил ее оставить.

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{rails_root}/Gemfile"
end

before_fork do |server, worker|
  # Перед тем, как создать первый рабочий процесс, мастер отсоединяется от базы.
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.connection.disconnect!

  # Ниже идет магия, связанная с 0 downtime deploy.
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # После того как рабочий процесс создан, он устанавливает соединение с базой.
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection
  require "amqp"
  environment = ENV['RAILS_ENV'] || 'development'
  amqpconfig = YAML::load(File.open('config/amqp.yml'))

  t = Thread.new { AMQP.start(amqpconfig[environment]) }
  sleep(1.0)

  EventMachine.next_tick do
    AMQP.channel ||= AMQP::Channel.new(AMQP.connection)
    AMQP.channel.queue("amqpgem.examples.rails23.warmup", :durable => true)

    3.times do |i|
      puts "[after_fork/amqp] Publishing a warmup message ##{i}"

      AMQP.channel.default_exchange.publish("A warmup message #{i} from #{Time.now.strftime('%H:%M:%S %m/%b/%Y')}", :routing_key => "amqpgem.examples.rails23.warmup")
    end
  end
end