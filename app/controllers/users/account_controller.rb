class Users::AccountController < ApplicationController
  before_action :authenticate_user!

  def account
    @user = current_user
  end

  def projects
    @projects = Project.lastProjects(current_user)
  end

  def comments
    @comments = BlogComment.lastComments(current_user)
  end

  def sondages
    @responses = PollsFieldsResponse.responsed(current_user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to userAccount_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :avatar, :cp, :city, :address)
  end

end
