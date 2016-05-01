class Admin::Projects::ProjectsController < Admin::AdminController
  before_action :authenticate_user!, only: [:create]

  def categories
    @categories = Category.all
  end

  def createcategory
    @categories = Category.all
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
      redirect_to admin_projectsAdminIndexGet_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

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

  def labeledprojects
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

  private

  def project_params
    params.require(:project).permit(:name, :content, :category_id, :thumb)
  end

end
