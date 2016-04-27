class PagesController < ApplicationController

  def home
    #code
  end

  def callback
    @state = params[:state].split(',')
    #@a = "#{@state[1]}(#{@state[0]},#{params[:code]})"
    session[:fb_token] = params[:code]
    redirect_to admin_blogPublishtoFacebook_url @state[0]
    #@oauth.url_for_access_token(params[:code])
  end

end
