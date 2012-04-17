# coding: utf-8
class Section < ActiveRecord::Base
	has_many :images, :order => :position
	has_many :dish_categories
	has_many :dishes, :through => :dish_categories
	
	belongs_to :note
  before_update :check_title
  before_destroy :standard_sections
	validates :title, :presence => true
  validates :title, :uniqueness => true  

  scope :visible, where('visible = ?', true)
  default_scope :order => 'position ASC'

  translates :title, :body
  accepts_nested_attributes_for :translations

  TITLES = ["On-line бронирование","Отзывы","Контакты и обратная связь","Банкетное предложение","Концепция и интерьер","Основные блюда","Завтраки","Детское меню","Барная карта"]

  def check_title
    if changes["title"] != nil
      if TITLES.member?(changes["title"].first) && changes["title"].first != title
        false
      end
    end
  end

  def standard_sections
      if TITLES.member?(title)
        errors.add(:base, "Невозможно удалить стандартную секцию")
      end
      errors.blank?
  end

end
