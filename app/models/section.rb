# coding: utf-8
class Section < ActiveRecord::Base
	has_many :images
	has_many :dish_categories
	has_many :dishes, :through => :dish_categories
	
	belongs_to :note
  before_update :check_title
	validates :title, :presence => true
  validates :title, :uniqueness => true  

  scope :visible, where('visible = ?', true)
  default_scope :order => 'position ASC'

  translates :title, :body
  accepts_nested_attributes_for :translations
  
  def check_title
    if changes["title"] != nil
      if (changes["title"].first == "On-line бронирование" || changes["title"].first == "Отзывы" || changes["title"].first == "Контакты и обратная связь" || changes["title"].first == "Банкетное предложение" || changes["title"].first == "Концепция и интерьер" || changes["title"].first == "Основные блюда" || changes["title"].first == "Завтраки" || changes["title"].first == "Детское меню" || changes["title"].first == "Барная карта") && changes["title"].first != title
        false
      end
    end
  end

end
