class PagesController < ApplicationController
	
	def index
		@title = "News&More"
	end

	def main
		@title = "News&More"
		@events = Event.all
		@posts = Post.all[1..3]
	end

	def about
	end
	
	def banquet
	end

	def main_dishes
		@main_dishes = Dish.main_dishes
	end
end
