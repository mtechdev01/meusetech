class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def markAsRead
    @notif = Notification.find(params[:id])
    @notif.readed = true;
    if @notif.save!
      @msg = { success: true}
    else
      @test = { success: false }
    end
    render json: @msg
  end

  def delete
    if request.post?
      @notif = Notification.find(params[:id])
      if @notif
        @notif.destroy
        flash[:notice]  = "Notification supprimée"
        flash[:class]   = "success"
        redirect_to :back
      else
        flash[:notice]  = "Aucune notifications trouvée"
        flash[:class]   = "danger"
        redirect_to :back
      end
    else
      flash[:notice]  = "Action interdite"
      flash[:class]   = "danger"
      redirect_to :back
    end
  end
  
end
