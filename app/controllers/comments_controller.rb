class CommentsController < ApplicationController

  include  Meusetech::Commentable

  def comment
    @comment = Meusetech::Commentable.saveComment?(comment_params)
    if @comment
      flash[:notice]  = "Commentaire enregistré"
      flash[:class]   = "success"
      notifUsers( params , 'Nouveau commentaire')
      redirect_to :back
    else
      flash[:notice]  = "Une erreur est survenue lors de l'ajout de votre commentaire"
      flash[:class]   = "danger"
      redirect_to :back
    end
  end

  def setValid
    if Meusetech::Commentable.setValid ( params[:id] )
      flash[:notice]  = "Commentaire validé, permission donnée à l'utilisateur"
      flash[:class]   = "success"
      redirect_to :back
    else
      flash[:notice]  = "Commentaire non validé"
      flash[:class]   = "danger"
      redirect_to :back
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    if request.post?
      if   @comment.destroy
        flash[:notice]  = "Commentaire supprimé"
        flash[:class]   = "success"
        redirect_to :back
      else
        flash[:notice]  = "Commentaire non supprimé"
        flash[:class]   = "danger"
        redirect_to :back
      end

    end

  end

  private

  def comment_params
    params.require(:comment)
      .permit(:content, :blog_article_id, :project_id, :user_id )
  end

  def notifUsers params, msg
    @notifParams = {
      msg:      msg,
      record:   params[:comment],
      model:    params[:notif][:model],
      sender:   params[:comment][:user_id],
      key:      params[:notif][:key],
      receiver: params[:notif][:receiver]
    }
    Meusetech::Notifiable.new(@notifParams).notif
  end

end
