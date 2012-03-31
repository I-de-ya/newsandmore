class Broadcast < ActiveRecord::Base
	belongs_to :sport
	validates :title, :presence => true
	default_scope :order => 'showtime ASC'
	scope :visible, :conditions => { :show => true }
end
