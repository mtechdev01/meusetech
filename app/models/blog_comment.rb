class BlogComment < ActiveRecord::Base
  belongs_to :blog_article, :counter_cache => true
  belongs_to :user
end
