class Post < ActiveRecord::Base

	default_scope :order => 'date ASC'

	mount_uploader :image, ImageUploader

end
