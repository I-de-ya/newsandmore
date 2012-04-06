class DishType < ActiveRecord::Base
  belongs_to :dish

  scope :visible, where('visible = ?', true)

  translates :title
  accepts_nested_attributes_for :translations
end