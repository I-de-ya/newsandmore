class Post < ActiveRecord::Base

	default_scope :order => 'created_at DESC'
	paginates_per 3
	mount_uploader :image, ImageUploader
	validates :title, :body, :presence => true
	scope :visible, :conditions => { :visible => true }
	
  translates :title, :body
end
