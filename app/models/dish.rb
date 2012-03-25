# coding:utf-8
class Dish < ActiveRecord::Base
	belongs_to :dish_category

end