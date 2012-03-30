class MenuSection < ActiveRecord::Base
	has_many :images
	has_many :dish_categories
	has_many :dishes, :through => :dish_categories

	validates :title, :presence => true
end