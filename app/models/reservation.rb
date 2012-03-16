class Reservation < ActiveRecord::Base
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :firstname, :lastname, :persons, :presence => true
	validates :email, :format => { :with => email_regex }
end
	
	
	