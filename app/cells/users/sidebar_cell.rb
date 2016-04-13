class Users::SidebarCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::UrlHelper

  def lastComments(user)
    @lastComments = BlogComment.lastComments(user).limit(5)
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

end
