class Image < ActiveRecord::Base
  belongs_to :section

  mount_uploader :image, ImageUploader
end
