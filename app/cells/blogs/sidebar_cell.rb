class Blogs::SidebarCell < Cell::ViewModel
  def show
    render
  end

  def userBlock
    @users = User.all
    render
  end

end
