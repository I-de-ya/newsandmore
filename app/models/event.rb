class Event < ActiveRecord::Base
	validates :title, :presence => true
	scope :visible, :conditions => { :visible => true }
  mount_uploader :image, ImageUploader

  translates :title, :body
  accepts_nested_attributes_for :translations
end
