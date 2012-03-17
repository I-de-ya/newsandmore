class PagesController < ApplicationController
	
	def index
		@title = "News&More"
	end

	def main
		@title = "News&More"
		@events = Event.all
		@movies = Movie.all
	end

	def about
	end
	
	def banquet
	end
end
