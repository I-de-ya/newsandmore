class Post < ActiveRecord::Base

	default_scope :order => 'date ASC'
	paginates_per 3
	mount_uploader :image, ImageUploader

end
