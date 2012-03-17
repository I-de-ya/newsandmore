class Dish < ActiveRecord::Base
	belongs_to :dish_category
	belongs_to :menu_type
end