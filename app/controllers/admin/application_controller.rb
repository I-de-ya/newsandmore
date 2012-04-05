#coding: utf-8
class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  before_filter :authenticate_user!

  before_filter :set_locale

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

private

  def set_locale
    I18n.locale = I18n.default_locale
  end
end