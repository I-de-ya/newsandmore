class Movie < ActiveRecord::Base
	validates :title, :showtime, :presence => true

	mount_uploader :image, ImageUploader
	scope :visible, :conditions => { :show => 'true' }
	default_scope :order => 'showtime ASC'
end
