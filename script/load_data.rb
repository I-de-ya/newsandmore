# coding:utf-8
require 'faker'

DishCategory.delete_all
Dish.delete_all
Post.delete_all

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
  image = File.open('app/assets/images/for_fake/2.jpg')
  Post.create!(:title => title,
               :body => body,
               :date => date,
               :image => image)
end