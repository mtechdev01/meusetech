class Admin::Blogs::ArticlesController < ApplicationController
  def create
    if user_signed_in?
      @article = BlogArticle.new
      @categories = BlogCategory.all
      if request.post?
        @article = BlogArticle.new article_params
        if @article.valid?
          @article.user = current_user
          if @article.save
            flash[:notice] ="Votre article a été ajouté."
            flash[:class] ="success"
            @article= nil
            redirect_to blogIndex_url
          else
            flash[:notice] = "Une erreur est survenue lors de l'ajout de votre article"
            flash[:class] = "danger"
            redirect_to :back
          end
        else
          flash[:notice] = "Formulaire invalide"
          flash[:class]= "danger"
        end
      end
    else
      flash[:notice] ="Vous n'avez pas accès à cette action"
      flash[:class] ="danger"
      redirect_to root_url
    end
  end

  private

  def article_params
    params.require(:articles).permit(:title, :content, :user_id, :blog_category_id, :thumb, :remove_thumb)
  end
end
