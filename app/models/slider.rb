class Slider < ActiveRecord::Base
	mount_uploader :slider_image, SliderImageUploader

	validates :title, :slider_image, :presence => true
end
