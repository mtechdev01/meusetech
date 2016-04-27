<<<<<<< HEAD
class Blogs::ArticlesController < ApplicationController

  def index
    @articles = BlogArticle.page(params[:page]).order('created_at DESC')
  end

  def show
    @article = BlogArticle.find(params[:id])
    @comments = @article.comments
  end

  def category
    @category = Category.find(params[:id])
  end
end
=======
class Blogs::ArticlesController < ApplicationController

  def index
    @articles = BlogArticle.page(params[:page]).order('created_at DESC')
  end

  def show
    @article = BlogArticle.find(params[:id])
    @comments = @article.comments
  end

  def category
    @category = Category.find(params[:id])
  end

end
>>>>>>> facebook
