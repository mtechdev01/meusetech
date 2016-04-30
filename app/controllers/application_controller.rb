class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :getnotifs
  before_filter :setFooterArticles

  protected

  def setFooterArticles
    @footerArticles = BlogArticle.order(created_at: :desc).limit(3)    
  end


  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def getnotifs
      if user_signed_in?
        @notifsAll       = Notification.where( receiver: current_user ).order(readed: :asc).limit(10)
        @notifsUnreaded  = Notification.unreaded( current_user )
      end
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
     devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
     #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
