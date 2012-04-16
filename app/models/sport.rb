class Sport < ActiveRecord::Base
  has_many :broadcasts
  validates :title, :presence => true
  scope :visible, :conditions => { :visible => true }
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :broadcasts, :allow_destroy => true

  translates :title
  accepts_nested_attributes_for :translations
end