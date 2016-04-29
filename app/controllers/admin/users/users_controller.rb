class Admin::Users::UsersController < Admin::AdminController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order( created_at: :desc).limit(10)
    @projects = @user.projects
    @polls = @user.polls
  end

  def edit
    @user = User.find(params[:id])
    @projects = @user.projects
    @comments = @user.comments.order( created_at: :desc)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to admin_usersAdminIndex_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    @comments = User.find(params[:id]).comments.destroy
    if @user.delete || @comments.delete
      flash[:notice] = "L'utilisateur a été supprimé"
      flash[:class] ="success"
    else
      flash[:notice] = "Une erreur est survenue lors de la suppression de l'utilisateur"
      flash[:class] ="danger"
    end
    redirect_to admin_adminDashboard_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :avatar, :cp, :city, :address, :email, :is_banned, :can_comment, projects_attributes: [:id, :name, :content], comments_attributes: [:id, :created_at, :content])
  end

end
