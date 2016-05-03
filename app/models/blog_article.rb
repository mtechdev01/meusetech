class BlogArticle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  mount_uploader :thumb, ThumbUploader

  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes

  self.per_page = 4

  validates_presence_of :title, :message => "Le titre de votre article est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre article est obligatoire"

  def messageSanitized
    @contentSanitized = ActionView::Base.full_sanitizer.sanitize( self.content.html_safe )
    return @contentSanitized
  end

end
