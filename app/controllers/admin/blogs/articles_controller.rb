class Admin::Blogs::ArticlesController < Admin::AdminController

  def index
    @articles = BlogArticle.all
  end

  def create
    if user_signed_in?
      @article = BlogArticle.new
      @categories = Category.all
      if request.post?
        @article = BlogArticle.new article_params
        if @article.valid?
          @article.user = current_user
          if @article.save
            flash[:notice] ="Votre article a été ajouté."
            flash[:class] ="success"
            @article= nil
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

  def redirecttofacebook
    @oauth = Koala::Facebook::OAuth.new(Rails.configuration.fb_id,Rails.configuration.fb_secret, callback_url)
    redirect_to @oauth.url_for_oauth_code(:permissions => Rails.configuration.fb_perms, :state => params[:id])
  end

  def publishtofacebook
      @oauth = Koala::Facebook::OAuth.new(Rails.configuration.fb_id,Rails.configuration.fb_secret, callback_url)
      @user_graph = Koala::Facebook::API.new(@oauth.get_access_token(session[:fb_token]))
      @page_id = Rails.configuration.fb_page_id
      @page_token = @user_graph.get_page_access_token(@page_id)
      @page_graph = Koala::Facebook::API.new(@page_token)
      @article = BlogArticle.find(params[:id])
      @page_graph.put_connections( @page_id, 'feed',  :message => @article.messageSanitized,
                                                  :name => @article.title,
                                                  :description => @article.category.name,
                                                  :picture => "http://#{request.host}:#{request.port}/#{@article.thumb}",
                                                  :link => blogShow_url(@article.id)
                                                  )
      flash[:notice] = "Article publié sur le mur de votre page Facebook"
      flash[:class]= "success"
      redirect_to :back
  end

  private

  def article_params
    params.require(:articles).permit(:title, :content, :user_id, :category_id, :thumb, :remove_thumb)
  end
end
