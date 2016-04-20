class BlogArticle < ActiveRecord::Base
  mount_uploader :thumb, ThumbUploader
  belongs_to :user, class_name: "User",
                        foreign_key: "user_id"
  belongs_to :category, class_name: "BlogCategory",
                          foreign_key: "blog_category_id"
  has_many :comments

  validates_presence_of :title, :message => "Le titre de votre article est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre article est obligatoire"

end
