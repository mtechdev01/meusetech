class BlogArticle < ActiveRecord::Base
  belongs_to :user, class_name: "User",
                        foreign_key: "user_id"
  belongs_to :category, class_name: "BlogCategory",
                          foreign_key: "blog_category_id"
  has_many :comments, class_name: "BlogComment",
                        foreign_key: "blog_article_id"

end
