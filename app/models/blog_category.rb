class BlogCategory < ActiveRecord::Base
  has_many :articles, class_name: "BlogArticle",
                          foreign_key: "projects_category_id"
end
