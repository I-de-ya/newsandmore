class Movie < ActiveRecord::Base
	validates :title, :showtime, :presence => true

	mount_uploader :image, ImageUploader

	default_scope :order => 'showtime ASC'
end
