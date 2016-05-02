class Projects::SidebarCell < Cell::ViewModel
  def show
    render
  end


  def mostCommentedProjects
    @projects = Project.mostActive
    render
  end

end
