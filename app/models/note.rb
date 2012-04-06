# coding: utf-8
class Note < ActiveRecord::Base
  has_many :sections

  attr_accessible :body, :title
  validates :body, :presence => true

  before_update :check_title

  translates :title, :body
  accepts_nested_attributes_for :translations
  def check_title
    if changes["title"] != nil
      if (changes["title"].first == "Информация для проведения банкетов" || changes["title"].first == "Благодарность за бронирование") && changes["title"].first != title
        false
      end
    end
  end
end