
class BlogArticle < ActiveRecord::Base
  mount_uploader :thumb, ThumbUploader
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes

  self.per_page = 2
  
  validates_presence_of :title, :message => "Le titre de votre article est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre article est obligatoire"

end
