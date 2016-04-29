
class Users::SidebarCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::DebugHelper

  def lastComments(user)
    @lastComments = Comment.lastComments(user).limit(5)
    render
  end

  def lastProjects(user)
    @lastProjects = Project.lastProjects(user).limit(5)
    render
  end

  def lastPollsResponses(user)
    @lastPollsResponses = PollsFieldsResponse.responsed(user).limit(5)
    render
  end

  def myNotifs(user)
    @notifications = Notification.where(receiver: user.id).order(readed: :asc)
    render
  end

end
