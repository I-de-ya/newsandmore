class PagesController < ApplicationController
	
	def index
		@title = "News&More"
	end

	def main
		@title = "News&More"
		@events = Event.all
	end

	def about
	end
	
end
