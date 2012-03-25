# coding: utf-8
class PagesController < ApplicationController
	before_filter :authenticate_admin!, :only => ['admin']
	def index
	end

	def main
		@title = "Главная"
		@events = Event.all
		@posts = Post.page(params[:page])
		@movies = Movie.all
		@sports = Sport.all
		@text = Text.find_by_title("Концепция и интерьер")

	end

	def about
		@text = Text.find_by_title("Концепция и интерьер")
		@text_banquets = Text.find_by_title("Информация для проведения банкетов")
	end
	
	def banquet
		@title = "Банкетное предложение"
		@text = Text.find_by_title("Банкетное предложение")
		@text_banquets = Text.find_by_title("Информация для проведения банкетов")
	end

	def main_dishes
		@title = "Основные блюда"
		@categories = DishCategory.main_dishes
		@text_banquets = Text.find_by_title("Информация для проведения банкетов")

	end

	def breakfasts
		@title = "Завтраки"
		@categories = DishCategory.breakfasts
		@text_banquets = Text.find_by_title("Информация для проведения банкетов")
	end
	
	def kids_menu
		@title = "Детское меню"
		@categories = DishCategory.kids_menu
		@text_banquets = Text.find_by_title("Информация для проведения банкетов")
	end
	
	def bar_list
		@title = "Барная карта"
		@categories = DishCategory.bar_list
		@text_banquets = Text.find_by_title("Информация для проведения банкетов")
	end

	def admin
		@title = "admin"
	end
end
