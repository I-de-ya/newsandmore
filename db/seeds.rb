# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

menu_types = ["Основные блюда","Завтраки", "Детское меню", "Барная карта", "Обеды", "Ужины"]
menu_types.map {|menu_type| MenuType.create(name:menu_type)}
