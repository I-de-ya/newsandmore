class Section < ActiveRecord::Base
	has_many :images
	has_many :dish_categories
	has_many :dishes, :through => :dish_categories
	
	belongs_to :note

	validates :title, :presence => true
  validates :title, :uniqueness => true  

  scope :visible, where('visible = ?', true)
  default_scope :order => 'position ASC'
end
