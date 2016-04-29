class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog_article, :counter_cache => true
  belongs_to :project, :counter_cache => true

  validates_uniqueness_of :user_id, scope: [:blog_article_id, :project_id], :message => "Vous aimez déjà ce contenu !"

end
