class Blogs::ArticlesController < ApplicationController

  def index
    @articles = BlogArticle.all
    @users = User.all
  end

  def show
    @article = BlogArticle.find(params[:id])
    @comments = @article.comments
  end

  def comment
    if request.post?
      @comment = BlogComment.new comment_params
      if @comment.save
        flash[:notice] = "Commentaire enregistré"
        flash[:class]= "success"
        redirect_to :back
      else
        flash[:notice] = "Une erreur est survenue lors de l'ajout de votre commentaire"
        flash[:class]= "danger"
        redirect_to :back
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :blog_article_id, :user_id)
  end
  
end
