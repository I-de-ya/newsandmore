class Event < ActiveRecord::Base
	default_scope :order => 'date ASC'
	validates :title, :presence => true
	scope :visible, :conditions => { :show => true }
  mount_uploader :image, ImageUploader
end
