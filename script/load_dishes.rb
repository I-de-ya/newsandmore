require 'faker'

DishCategory.delete_all
Dish.delete_all
    
10.times do |n|
	name = Faker::Company.name
 	DishCategory.create!(:name => name)
end

50.times do |n|
  name = Faker::Address.city
  description = Faker::Lorem.paragraph
  price = (1+rand(10))*50
  portion = (1+rand(10))*25
	dish_category_id = DishCategory.first.id + rand(DishCategory.last.id - DishCategory.first.id + 1)
  menu_type_id = MenuType.first.id + rand(MenuType.last.id - MenuType.first.id + 1)
  Dish.create!(:name => name,
  			       :description => description,
        			 :price => price,
       				 :portion => portion,
               :dish_category_id => dish_category_id,
               :menu_type_id => menu_type_id)
end