class Note < ActiveRecord::Base
  has_many :sections

  attr_accessible :body, :title
  validates :body, :presence => true

  translates :title, :body
end