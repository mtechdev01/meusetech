class Project < ActiveRecord::Base
  mount_uploader :thumb, ThumbUploader
  has_many :comments
  has_many :followers, class_name: "ProjectsFollower",
                          foreign_key: "project_id"
  belongs_to :category
  belongs_to :user

  self.per_page = 2

  validates_presence_of :name, :message => "Le nom de votre projet est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre projet est obligatoire"

  def self.lastProjects user
    where( user_id: user.id ).order( created_at: :desc)
  end

end
