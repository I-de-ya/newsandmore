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

  def check_title
    if changes["title"] != nil
      if (changes["title"].first == "On-line бронирование" || changes["title"].first == "Отзывы" || changes["title"].first == "Контакты и обратная связь" || changes["title"].first == "Банкетное предложение") && changes["title"].first != title
        false
      end
    end
  end

end
