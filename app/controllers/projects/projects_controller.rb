class Projects::ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    #@comments = ProjectsComment.where :project_id => @project.id
  end

  def comment
    if request.post?
      @comment = ProjectsComment.new comment_params
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

end
