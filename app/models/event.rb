class Event < ActiveRecord::Base
	default_scope :order => 'date ASC'
	validates :title, :presence => true
end
