class Projects::SidebarCell < Cell::ViewModel
  def show
    render
  end


  def mostCommentedProjects
    @projects = Project.order(comments_count: :desc)
    render
  end

end
