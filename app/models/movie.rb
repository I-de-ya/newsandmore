class Movie < ActiveRecord::Base
	validates :title, :showtime, :presence => true

	mount_uploader :image, ImageUploader
	scope :visible, :conditions => { :visible => true }
	default_scope :order => 'showtime ASC'

  translates :title, :origin, :genre, :description, :director, :starring, :country
end