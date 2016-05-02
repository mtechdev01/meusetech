class Projects::ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :follow]

  def index
    @projects = Project.page(params[:page]).order('created_at DESC')
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    if current_user
      @follow = ProjectsFollower.where( user: current_user, project: @project ).first
    end

  end

  def category
    @category = Category.find(params[:id])
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
            redirect_to projectsIndex_url
          else
            flash[:notice] = "Une erreur est survenue lors de l'ajout de votre projet"
            flash[:class] = "danger"
            redirect_to projectsIndex_url
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

  def follow
    @follow = ProjectsFollower.where({ user: current_user, project_id: params[:id] }).first
    if @follow
      @follow.delete
      flash[:notice] ="Vous ne suivez plus ce projet !"
      flash[:class] ="success"
      redirect_to :back
    else
      ProjectsFollower.create({ user: current_user, project_id: params[:id] })
      flash[:notice] ="Vous suivez désormais ce projet !"
      flash[:class] ="success"
      redirect_to :back
    end
  end

  def project_params
    params.require(:project).permit(:name, :content, :category_id, :thumb, :location, :state)
  end

end
