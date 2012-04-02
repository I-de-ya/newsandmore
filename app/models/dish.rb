# coding:utf-8
class Dish < ActiveRecord::Base
	belongs_to :dish_category
  has_many :dish_types
	validates :name, :presence => true
  
  scope :visible, where('visible = ?', true)
end