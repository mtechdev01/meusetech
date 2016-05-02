class Blogs::SidebarCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper
  def show
    render
  end

  def articleCategory(id = false)

    if !id
      @categories = Category.all
    else
      @categories = Category.where.not(id: id)
    end
    render
  end

  def mostCommented
    @articles = BlogArticle.order(comments_count: :desc)
    render
  end

end
