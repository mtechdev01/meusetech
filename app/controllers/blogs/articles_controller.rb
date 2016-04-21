class Blogs::ArticlesController < ApplicationController

  def index
    @articles = BlogArticle.all
    @users = User.all
  end

  def show
    @article = BlogArticle.find(params[:id])
    @comments = @article.comments
  end

  def category
    @category = BlogCategory.find(params[:id])
  end

end
