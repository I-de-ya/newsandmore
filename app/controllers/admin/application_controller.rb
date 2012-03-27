#coding: utf-8
class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  before_filter :authenticate_admin!

  private
  def require_admin
    #redirect_to root_url, alert: "Недостаточно прав для доступа к этому разделу" if !(user_signed_in? && current_user.admin)
  end
end