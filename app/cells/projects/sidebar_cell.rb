class Projects::SidebarCell < Cell::ViewModel
  def show
    render
  end

  def projectsCategory(id = false)

    if !id
      @categories = Category.all
    else
      @categories = Category.where.not(id: id)
    end
    render
  end

  def mostCommentedProjects
    @projects = Project.mostActive
    render
  end

end
