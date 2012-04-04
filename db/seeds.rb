# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sections = ["Концепция и интерьер","Основные блюда","Завтраки", "Детское меню", "Барная карта", "Банкетное предложение", "On-line бронирование", "Отзывы", "Контакты и обратная связь"]
sections.map {|section| Section.create(title:section, slug:section.parameterize)}
Note.create!([{title: "Информация для проведения банкетов", :body => "Можно и банкетик заказать"},{title: "Благодарность за бронирование", :body => "Благодарим за бронирование"}])
User.create(email: 'admin@redde.ru', password: '123123', password_confirmation:"123123")