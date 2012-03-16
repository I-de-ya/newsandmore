# coding: utf-8
class Recall < ActiveRecord::Base
	validates :name, :body, :presence => true
end
