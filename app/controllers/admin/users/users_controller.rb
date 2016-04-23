class Admin::Users::UsersController < Admin::AdminController
  def index
    @users = User.all
    @usersProjects = Project.where(user_id:current_user)
    @userProjectsCount  = @usersProjects.count
    @usersComments = Comment.where(user_id:current_user)
    @userCommentsCount = @usersComments.count
  end
end
