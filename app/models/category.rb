class Category < ActiveRecord::Base

  has_many :articles, class_name: "BlogArticle",
                          foreign_key: "category_id"
  has_many :projects
  
end
