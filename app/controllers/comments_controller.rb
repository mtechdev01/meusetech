class CommentsController < ApplicationController

  include  Meusetech::Commentable

  def comment
    if Meusetech::Commentable.saveComment?(comment_params)
      flash[:notice] = "Commentaire enregistré"
      flash[:class]= "success"
      redirect_to :back
    else
      flash[:notice] = "Une erreur est survenue lors de l'ajout de votre commentaire"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  def setValid
    if Meusetech::Commentable.setValid ( params[:id] )
      flash[:notice] = "Commentaire validé, permission donnée à l'utilisateur"
      flash[:class]= "success"
      redirect_to :back
    else
      flash[:notice] = "Commentaire non validé"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :blog_article_id, :project_id, :user_id)
  end

end
