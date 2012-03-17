# coding:utf-8
class Dish < ActiveRecord::Base
	belongs_to :dish_category
	belongs_to :menu_type

	main_dishes_id = MenuType.where(:name => "Основные блюда").first.id
	breakfasts_id = MenuType.where(:name => "Завтраки").first.id
	
	scope :main_dishes, where(:menu_type_id => main_dishes_id)
	scope :breakfasts, where(:menu_type_id => breakfasts_id)

	private
	

end