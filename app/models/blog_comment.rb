class BlogComment < ActiveRecord::Base

  belongs_to :blog_article, :counter_cache => true
  belongs_to :user

  def self.lastComments user
    where( user_id: user.id ).order( created_at: :desc)
  end

end
