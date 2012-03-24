class Slider < ActiveRecord::Base
	mount_uploader :slider_image, SliderImageUploader
end
