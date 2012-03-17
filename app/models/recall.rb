# coding: utf-8
class Recall < ActiveRecord::Base
	validates :name, :body, :presence => true

	scope :positive, where("positivity = ?" , "Положительный")
	scope :negative, where("positivity = ?" , "Отрицательный")
	
end
