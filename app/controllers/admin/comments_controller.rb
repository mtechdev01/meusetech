class Admin::CommentsController < Admin::AdminController

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
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
    @comment = Comment.find(params[:id])
    if @comment != nil
      @comment.destroy
      flash[:notice] ="Le commentaire à été supprimé"
      flash[:class] = "success"
      redirect_to :back
    else
      flash[:notice] ="Le commentaire est inexistant"
      flash[:class] = "danger"
      redirect_to :back
    end
  end

    private

    def comment_params
      params.require(:comment).permit(:id, :created_at, :content)
    end

end
