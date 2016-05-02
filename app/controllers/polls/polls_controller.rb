class Polls::PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def show
    if Poll.hasResponded current_user
      flash[:notice] = "Vous avez déjà répondus au sondage"
      flash[:class]= "danger"
      redirect_to pollStats_url
    else
      @poll = Poll.find(params[:id])
    end
  end

  def stats
    @poll = Poll.find(params[:id])
    @usersResponded = Array.new
    PollsFieldsResponse.where(poll_id: params[:id]).group(:user_id).find_each do | user |
      @usersResponded << User.find( user.user.id )
    end
    @userTotal = User.count
    @statsResponse = Array.new
    @poll.fields.each_with_index do | field, index |
      @CountResponse = PollsFieldsResponse.where( polls_field_id: field.id ).count(:all)
      @Allresponses = PollsFieldsResponse.where( polls_field_id: field.id ).group(:response)
      @statsResponse[index] = { :label     => field.label, :rsp => Array.new }
      @Allresponses.each do | response |
        if field.options
          @rspFormatted = field.optionsFormated[response.response.to_i]
        else
          @rspFormatted = response.response
        end
        @statsResponse[index][:rsp] << {
          :response  => @rspFormatted,
          :responded => PollsFieldsResponse.where( polls_field_id: field.id, response: response.response.to_s ).count(:all),
          :max       => @CountResponse
        }
      end
    end
  end

  def reponse
    if request.post?
      @fields = params[:fields]
      @fields[:questions].each_with_index do | value, index |
        @response = PollsFieldsResponse.new
        @response.user_id = current_user.id
        @response.poll_id = @fields[:poll_id]
        @response.polls_field_id = value[0]
        @response.response = value[1].to_s
        @response.save
      end
      if @response.save
        flash[:notice] = "Votre sondage a bien été enregistré, merci pour votre participation."
        flash[:class]= "success"
        redirect_to pollStats_url
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
