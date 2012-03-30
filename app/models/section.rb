class Section < ActiveRecord::Base
	has_many :images
	has_many :dish_categories
	has_many :dishes, :through => :dish_categories

	belongs_to :text

	validates :title, :presence => true
end
