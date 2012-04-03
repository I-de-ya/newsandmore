class Sport < ActiveRecord::Base
	has_many :broadcasts
	validates :title, :presence => true
	scope :visible, :conditions => { :visible => true }
  mount_uploader :image, ImageUploader
end
