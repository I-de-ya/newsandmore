class Reservation < ActiveRecord::Base
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :firstname, :lastname, :persons, :phone, :date_and_time, :presence => true
	validates :email, :format => { :with => email_regex }
	validates :persons, :numericality => {:greater_than_or_equal_to => 1}
end