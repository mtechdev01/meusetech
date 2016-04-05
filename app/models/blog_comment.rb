class BlogComment < ActiveRecord::Base
  belongs_to :blog_article
  belongs_to :user
end
