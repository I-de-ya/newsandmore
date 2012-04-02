class StaticText < ActiveRecord::Base
  has_many :sections

  attr_accessible :body
  validates :body, :presence => true
end
