require 'faker'

namespace :db do
  desc "Fill database with sample dishes"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    10.times do |n|
      name = Faker::Company.name
      DishCategory.create!(:name => name)
    end

    50.times do |n|
      name = Faker::Address.city
      description = Faker::Lorem.paragraph
      price = (1+rand(10))*50
      portion = (1+rand(10))*25
      category_id = DishCategory.first.id + rand(DishCategory.last.id - DishCategory.first.id + 1)
      Dish.create!(:name => name,
                    :description => description,
                    :price => price,
                    :portion => portion,
                    :category_id => category_id)
    end
  end
end