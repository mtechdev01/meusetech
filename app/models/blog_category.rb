class BlogCategory < ActiveRecord::Base
  has_many :articles, class_name: "BlogArticle",
                          foreign_key: "blog_category_id"
end
