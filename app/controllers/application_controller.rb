class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  before_filter :set_locale

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

end
