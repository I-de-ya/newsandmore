class Slider < ActiveRecord::Base
	mount_uploader :slider_image, SliderImageUploader
	scope :visible, :conditions => { :visible => true }
	validates :title, :slider_image, :presence => true

  translates :title
  accepts_nested_attributes_for :translations
end
