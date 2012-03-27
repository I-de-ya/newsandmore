# coding:utf-8
require 'faker'

DishCategory.delete_all
Dish.delete_all
Post.delete_all
Slider.delete_all
Recall.delete_all
Movie.delete_all
Event.delete_all

30.times do |n|
	name = Faker::Company.name
  menu_type_id = MenuType.first.id + rand(MenuType.last.id - MenuType.first.id + 1)
 	DishCategory.create!(:name => name, :menu_type_id => menu_type_id)
end

100.times do |n|
  name = Faker::Address.city
  description = Faker::Lorem.paragraph
  price = (1+rand(10))*50
  portion = (1+rand(10))*25
	dish_category_id = DishCategory.first.id + rand(DishCategory.last.id - DishCategory.first.id + 1)
  Dish.create!(:name => name,
  			       :description => description,
        			 :price => price,
       				 :portion => portion,
               :dish_category_id => dish_category_id)
end

20.times do |n|
  title = Faker::Address.city
  body = Faker::Lorem.paragraph
  date = rand(1.year).since
  file_array = Dir['app/assets/images/for_fake/*.jpg']
  image = File.open(file_array[rand(file_array.size)])
  Post.create!(:title => title,
               :body => body,
               :date => date,
               :image => image)
end

20.times do |n|
  title = Faker::Address.city
  body = Faker::Lorem.paragraph
  date = rand(1.year).since
  file_array = Dir['app/assets/images/for_fake/*.jpg']
  image = File.open(file_array[rand(file_array.size)])
  Event.create!(:title => title,
               :body => body,
               :date => date)
end

20.times do |n|
  title = Faker::Address.city
  origin = Faker::Address.city
  genre = Faker::Address.city
  description = Faker::Lorem.paragraph
  original = Faker::Address.city
  director =Faker::Address.city
  starring = Faker::Address.city
  country = Faker::Address.city
  date = rand(1.year).since
  showtime = Date.today + rand(20)
  file_array = Dir['app/assets/images/for_fake/*.jpg']
  image = File.open(file_array[rand(file_array.size)])
  Movie.create!(:title => title,
                :origin => origin,
                :genre => genre,
                :year => "1978",
                :description => description,
                :original_title => original,
                :director  => director,
                :starring => starring,
                :country => country,
                :premiere => date,
                :duration => date,
                :showtime => showtime,
                :image => image)
end

10.times do |n|
  title = Faker::Lorem.sentence
  visible = rand(2) == 1
  file_array = Dir['app/assets/images/for_fake/index_slider/*.png']
  image = File.open(file_array[rand(file_array.size)])
  Slider.create!(:title => title,
                 :visible => visible,
                 :slider_image => image)
end

10.times do |n|
  name = Faker::Address.city
  email = Faker::Internet.email
  body = Faker::Lorem.paragraph
  positivity = rand(2) == 1 ? "Положительный" : "Отрицательный"
  Recall.create!(:name => name,
                 :email => email,
                 :body => body,
                 :positivity => positivity)
end