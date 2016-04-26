class Admin::PagesController < Admin::AdminController

  def home
    @lastUsers      = User.order(created_at: :desc).limit(10)
    @lastConnected  = User.order(last_sign_in_at: :desc).limit(10)
    @usersCount     = User.count(:all)

    @comments30DaysCount = Comment.recent.count(:all)
    @commentsLast10 = Comment.recent.limit(10)
    @commentsCount  = Comment.count(:all)

    @articlesCount  = BlogArticle.count(:all)
    @articlesLast   = BlogArticle.order(created_at: :desc).limit(6)

    @projectsCount  = Project.count(:all)
    @projectsLast   = Project.order(created_at: :desc).limit(6)
  end

end
