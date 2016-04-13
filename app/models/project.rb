class Project < ActiveRecord::Base
  has_many :comments, class_name: "ProjectsComment",
                          foreign_key: "project_id"
  has_many :followers, class_name: "ProjectsFollower",
                          foreign_key: "project_id"
  belongs_to :category, class_name: "ProjectsCategory",
                          foreign_key: "projects_category_id"
  belongs_to :user


  validates_presence_of :name, :message => "Le nom de votre projet est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre projet est obligatoire"

  def self.lastProjects user
    where( user_id: user.id ).order( created_at: :desc)
  end

end
