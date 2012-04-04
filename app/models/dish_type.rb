class DishType < ActiveRecord::Base
  belongs_to :dish

  scope :visible, where('visible = ?', true)

  translates :title
end