class Blogs::ArticlesController < ApplicationController

  def index
    @articles = BlogArticle.page(params[:page]).order('created_at DESC')
  end

  def show
    @article = BlogArticle.friendly.find(params[:slug])
    @comments = @article.comments
  end

  def category
    @category = Category.friendly.find(params[:slug])
  end

end
