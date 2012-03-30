# coding: utf-8
class PagesController < ApplicationController
	
	def index
		@title = "Главная"
		@sliders = Slider.last
	end

	def main
		@title = "Главная"
		@events = Event.all
		@posts = Post.page(params[:page])
		@movies = Movie.where("showtime <'#{Date.today + 7}'AND showtime > '#{Date.today}'")
		@sports = Sport.all
		@about = Section.find_by_title("Концепция и интерьер")
		@main_dishes = Section.find_by_title("Основные блюда")
		@breakfasts = Section.find_by_title("Завтраки")
		@bar_list = Section.find_by_title("Барная карта")
		@banquet = Section.find_by_title("Банкетное предложение")
		@kids_menu = Section.find_by_title("Детское меню")

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
end
