class Sport < ActiveRecord::Base
	has_many :broadcasts
	validates :title, :presence => true
	scope :visible, :conditions => { :show => 'true' }
  mount_uploader :image, ImageUploader
end
