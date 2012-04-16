#coding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  before_filter :set_locale
  before_filter :fixed_sections

def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
end

  protected

  # Set the locale from parameters
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def fixed_sections
    @on_line_reservation_link = Section.find_by_title("On-line бронирование")
    @contacts_link = Section.find_by_title("Контакты и обратная связь")
    @recalls_link = Section.find_by_title("Отзывы")
  end

end
