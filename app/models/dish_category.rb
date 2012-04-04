# coding:utf-8
class DishCategory < ActiveRecord::Base
	belongs_to :section
	has_many :dishes

	validates :name, :presence => true
	
  scope :visible, where('visible = ?', true)

  translates :name
end
