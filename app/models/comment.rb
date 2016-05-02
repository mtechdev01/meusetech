class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog_article, :counter_cache => true
  belongs_to :project, :counter_cache => true

  scope :recent, lambda{ where(['created_at > ?', 30.days.ago]) }

  validates_presence_of :content, :message => "Le commentaire ne peut être vide"


  def self.lastComments user
    where( user_id: user.id ).order( created_at: :desc)
  end
  
end
