class Admin::Polls::PollsController < Admin::AdminController

  def index
    @polls = Poll.all
  end

  def show
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

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to admin_pollsAdminIndex_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  def create
    @poll = Poll.new
    if request.post?
      @poll = Poll.new poll_params
      if @poll.valid?
        if @poll.save
          flash[:notice] ="Votre sondage a été ajouté."
          flash[:class] ="success"
          redirect_to admin_pollsAdminAddQuestion_url @poll.id
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre sondage"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
      end
    end
  end

  def delete
    if params[:id]
      @poll = Poll.find(params[:id])
      if @poll
        if @poll.destroy!
          flash[:notice] ="Votre sondage a été supprimé."
          flash[:class] ="success"
          redirect_to admin_pollsAdminIndex_url
        else
          flash[:notice] = "Une erreur est survenue lors de la suppression de votre sondage"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Le sondage n'existe pas!"
        flash[:class] = "danger"
        redirect_to :back
      end
    end
  end

  def addquestion
    @poll = Poll.find(params[:id])
    @field = PollsField.new
    if request.post?
      @field = PollsField.new field_params
      @field.poll = @poll
      if @field.valid?
        if @field.save
          flash[:notice] ="Votre question a été ajouté."
          flash[:class] ="success"
          @field = nil
          redirect_to admin_pollsAdminAddQuestion_url
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre sondage"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
      end
    end
  end

  def editquestion
    @pollFields = PollsField.find( params[:id] )
  end

  def updatequestion
    if params[:id]
      @pollFields = PollsField.find( params[:id] )
      if @pollFields.update_attributes( field_params )
        flash[:notice] = "La mise à jour à été effectuée"
        flash[:class]= "success"
        redirect_to admin_pollsAdminIndex_url
      else
        flash[:notice] = "Erreur lors de la mise à jour"
        flash[:class]= "danger"
        redirect_to :back
      end
    end
  end

  def deletequestion
    if params[:id]
      @pollFields = PollsField.find(params[:id])
      if @pollFields
        if @pollFields.destroy!
          flash[:notice] ="Votre question a été supprimé."
          flash[:class] ="success"
          redirect_to admin_pollsAdminIndex_url
        else
          flash[:notice] = "Une erreur est survenue lors de la suppression de votre question"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "La question n'existe pas!"
        flash[:class] = "danger"
        redirect_to :back
      end
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :description, :start_at, :end_at)
  end

  def field_params
    params.require(:pollFields).permit(:name, :label, :is_required, :input_type, :options, :rules)
  end

end
