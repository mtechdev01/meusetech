class Admin::CategoryController < Admin::AdminController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    if user_signed_in?
      @category = Category.new
      if request.post?
        @category = Category.new article_params
        if @category.valid?
          if @category.save
            flash[:notice] ="Votre article a été ajouté."
            flash[:class] ="success"
            @category = nil
            redirect_to admin_blogsAdminIndex_url
          else
            flash[:notice] = "Une erreur est survenue lors de l'ajout de votre article"
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

  def delete
    @category = Category.find(params[:id])
  end

  private

  private

  def article_params
    params.require(:category).permit(:name, :icon, :color)
  end

end
