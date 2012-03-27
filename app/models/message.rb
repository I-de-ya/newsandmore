class Message < ActiveRecord::Base
	validates :name, :body, :presence => true
end
