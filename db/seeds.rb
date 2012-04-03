# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sections = ["Концепция и интерьер","Основные блюда","Завтраки", "Детское меню", "Барная карта", "Банкетное предложение", "On-line бронирование", "Отзывы", "Контакты и обратная связь"]
sections.map {|section| Section.create(title:section)}
Text.create!([{title: "Концепция и интерьер", :body => "Концепция ниче так"},
	{title: "Информация для проведения банкетов", :body => "Можно и банкетик заказать"},
	{title: "Банкетное предложение", :body => "Чуть подробней о банкетиках"}])