# coding: utf-8
class Recall < ActiveRecord::Base
	validates :name, :body, :presence => true
  default_scope :order => 'created_at DESC'
	scope :visible, :conditions => { :show => true }
	scope :positive, where("positiveness = ?" , true)
	scope :negative, where("positiveness = ?" , false)
end
