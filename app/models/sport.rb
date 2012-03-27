class Sport < ActiveRecord::Base
	has_many :broadcasts
	validates :title, :presence => true
end
