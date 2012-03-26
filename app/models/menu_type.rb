class MenuType < ActiveRecord::Base
	has_many :dish_categories
	has_many :dishes, :through => :dish_categories

	validates :name, :presence => true
end
