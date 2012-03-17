class PagesController < ApplicationController
	
	def index
		@title = "News&More"
	end

	def main
		@title = "News&More"
		@events = Event.all
		@posts = Post.all[1..3]
		@movies = Movie.all
	end

	def about
	end
	
	def banquet
	end

	def main_dishes
		@main_dishes = Dish.main_dishes
	end

	def breakfasts
		@breakfasts = Dish.breakfasts
	end
	
	def kids_menu
		@kids_menu = Dish.kids_menu
	end
	
	def bar_list
		@bar_list = Dish.bar_list
	end
end
