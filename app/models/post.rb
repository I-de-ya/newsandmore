class Post < ActiveRecord::Base

	default_scope :order => 'date ASC'
end
