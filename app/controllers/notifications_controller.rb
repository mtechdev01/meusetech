class NotificationsController < ApplicationController

  def markAsRead
    @notif = Notification.find(params[:id])
    #@notif.readed = true;
    #if @notif.save!
    #  @msg = { success: true}
    #else
    #  @test = { success: false }
    #end
    @msg = { success: true}
    render json: @msg
  end

end
