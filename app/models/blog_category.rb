class BlogCategory < ActiveRecord::Base
  has_many :blog_articles
end
