class Broadcast < ActiveRecord::Base
	belongs_to :sport
	validates :title, :presence => true
end
