# coding:utf-8
class Dish < ActiveRecord::Base
	belongs_to :dish_category
	belongs_to :menu_type

	main_dishes_id = MenuType.where(:name => "Основные блюда").first.id
	breakfasts_id = MenuType.where(:name => "Завтраки").first.id
	kids_menu_id = MenuType.where(:name => "Детское меню").first.id
	bar_list_id = MenuType.where(:name => "Барная карта").first.id
	
	scope :main_dishes, where(:menu_type_id => main_dishes_id)
	scope :breakfasts, where(:menu_type_id => breakfasts_id)
	scope :kids_menu, where(:menu_type_id => kids_menu_id)
	scope :bar_list, where(:menu_type_id => bar_list_id)

end