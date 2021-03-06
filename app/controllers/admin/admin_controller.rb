class Admin::AdminController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :isAdmin

  layout "admin"

  protected

  def isAdmin
    if !current_user.is_admin
      flash[:notice]  = "Vous n'êtes pas autorisé à acceder à cette page"
      flash[:class]   = "danger"
      redirect_to :root
    end
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
     #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
     #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
