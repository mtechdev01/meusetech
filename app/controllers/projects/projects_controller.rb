class Projects::ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    #@comments = ProjectsComment.where :project_id => @project.id
  end

  def create
    if user_signed_in?
      @project = Project.new
      @categories = ProjectsCategory.all
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

  def comment
    if request.post?
      @comment = Comment.new comment_params
      if @comment.save
        flash[:notice] = "Commentaire enregistré"
        flash[:class]= "success"
        redirect_to :back
      else
        flash[:notice] = "Une erreur est survenue lors de l'ajout de votre commentaire"
        flash[:class]= "danger"
        redirect_to :back
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :project_id, :user_id)
  end

  def project_params
    params.require(:project).permit(:name, :content, :projects_category_id)
  end

end
