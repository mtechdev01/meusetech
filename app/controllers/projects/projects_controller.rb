class Projects::ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @projects = Project.page(params[:page]).order('created_at DESC')
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
  end

  def create
    if user_signed_in?
      @project = Project.new
      @categories = Category.all
      if request.post?
        @project = Project.new project_params
        if @project.valid?
          @project.user = current_user
          if @project.save
            flash[:notice] ="Votre projet a été ajouté."
            flash[:class] ="success"
            redirect_to :back
          else
            flash[:notice] = "Une erreur est survenue lors de l'ajout de votre projet"
            flash[:class] = "danger"
            redirect_to :back
          end
        else
          flash[:notice] = "Formulaire invalide"
          flash[:class]= "danger"
        end
      end
    else
      flash[:notice] ="Vous n'avez pas accès à cette action"
      flash[:class] ="danger"
      redirect_to root_url
    end
  end

  def project_params
    params.require(:project).permit(:name, :content, :projects_category_id)
  end

end
