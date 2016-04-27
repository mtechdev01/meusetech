class Polls::PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def reponse
    if request.post?
      @fields = params[:fields]
      @fields[:questions].each_with_index do | value, index |
        @response = PollsFieldsResponse.new
        @response.user_id = current_user.id
        @response.poll_id = @fields[:poll_id]
        @response.polls_field_id = index
        @response.response = value
        @response.save
      end
      if @response.save
        flash[:notice] = "Votre sondage a bien été enregistré, merci pour votre participation."
        flash[:class]= "success"
        redirect_to pollIndex_url
      else
        flash[:notice] = "Une erreur est survenue."
        flash[:class]= "danger"
        redirect_to :back
      end
    end
  end

private
  def response_params
    params.require(:fields).permit(:poll_id,
    :polls_field_id,
    :user_id,
    :responses)

  end

end
