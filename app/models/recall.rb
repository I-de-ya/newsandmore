# coding: utf-8
class Recall < ActiveRecord::Base
	validates :name, :body, :presence => true

	scope :positive, where("positiveness = ?" , true)
	scope :negative, where("positiveness = ?" , false)
end
