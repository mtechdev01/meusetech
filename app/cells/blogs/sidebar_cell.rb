class Blogs::SidebarCell < Cell::ViewModel
  def show
    render
  end

  def articleCategory(id = false)

    if !id
      @categories = BlogCategory.all
    else
      @categories = BlogCategory.where.not(id: id)
    end
    render
  end

  def mostCommented
    @articles = BlogArticle.order(blog_comments_count: :desc)
    render
  end

end
