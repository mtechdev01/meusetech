class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog_article, :counter_cache => true
  belongs_to :project, :counter_cache => true
  
  def self.lastComments user
    where( user_id: user.id ).order( created_at: :desc)
  end
end
