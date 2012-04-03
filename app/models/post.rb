class Post < ActiveRecord::Base

	default_scope :order => 'created_at ASC'
	paginates_per 3
	mount_uploader :image, ImageUploader
	validates :title, :body, :presence => true
	scope :visible, :conditions => { :visible => true }
	
end
