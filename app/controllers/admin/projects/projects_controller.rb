class Admin::Projects::ProjectsController < ApplicationController
  def index
    @categories = Category.name
    @projects = Project.all
  end
  def projectdelete
    @project = Project.find(params[:id])
    if @project != nil
      @project.destroy
      flash[:notice] ="Ce projet à été supprimé"
      flash[:class] = "success"
      redirect_to :back
    else
      flash[:notice] ="Ce projet est inexistant"
      flash[:class] = "danger"
      redirect_to :back
    end
  end
  def editproject
    @project = Project.find(params[:id])
    @categories = Category.all
  end
  def updateproject
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to admin_usersAdminIndex_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :content, :category_id, :thumb)
  end
end
