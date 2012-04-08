# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Note.create!([{title: "Информация для проведения банкетов", :body => "Можно и банкетик заказать"},{title: "Благодарность за бронирование", :body => "Благодарим за бронирование"}])
User.create(email: 'admin@redde.ru', password: '123123', password_confirmation:"123123")

sections = [{:ru => "Концепция и интерьер", :en => "Concept and interior"},
            {:ru => "Основные блюда", :en => "Main dishes"},
            {:ru => "Завтраки", :en => "Breakfasts"},
            {:ru => "Детское меню", :en => "Kids menu"},
            {:ru => "Барная карта", :en => "Bar list"},
            {:ru => "Банкетное предложение", :en => "Banquet proposal"},
            {:ru => "On-line бронирование", :en => "On-line reservation"},
            {:ru => "Отзывы", :en => "Recalls"},
            {:ru => "Контакты и обратная связь", :en => "Contacts and feedback"}]

sections.each_index do |i|
  I18n.locale = 'ru'
  section = Section.new :title => sections[i][:ru]
  I18n.locale = 'en'
  section.title = sections[i][:en]
  section.save
end