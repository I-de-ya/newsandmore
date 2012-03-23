# coding: utf-8
class PagesController < ApplicationController
	
	def index
	end

	def main
		@title = "Главная"
		@events = Event.all
		@posts = Post.page(params[:page])
		@movies = Movie.all
		@sports = Sport.all
		
	end

	def about
	end
	
	def banquet
		@title = "Банкетное предложение"
	end

	def main_dishes
		@title = "Основные блюда"
		@main_dishes = Dish.main_dishes
	end

	def breakfasts
		@title = "Завтраки"
		@breakfasts = Dish.breakfasts
	end
	
	def kids_menu
		@title = "Детское меню"
		@kids_menu = Dish.kids_menu
	end
	
	def bar_list
		@title = "Барная карта"
		@bar_list = Dish.bar_list
	end
end
