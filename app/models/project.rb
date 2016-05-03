class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  mount_uploader :thumb, ProjectUploader

  has_many :comments
  has_many :likes
  has_many :followers, class_name: "ProjectsFollower",
                          foreign_key: "project_id"
  belongs_to :category
  belongs_to :user

  self.per_page = 4

  validates_presence_of :name, :message => "Le nom de votre projet est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre projet est obligatoire"

  def self.lastProjects user
    where( user_id: user.id ).order( created_at: :desc)
  end

  def self.mostActive
    order("likes_count + comments_count*6 DESC")
    .limit(3)
  end

end
