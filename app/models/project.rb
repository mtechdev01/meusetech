class Project < ActiveRecord::Base
  has_many :comments, class_name: "ProjectsComment",
                          foreign_key: "project_id"
  has_many :followers, class_name: "ProjectsFollower",
                          foreign_key: "project_id"
  belongs_to :category, class_name: "ProjectsCategory"
  belongs_to :user


  validates_presence_of :name, :message => "Le nom de votre projet est obligatoire"
  validates_presence_of :content, :message => "Le contenu de votre projet est obligatoire"

end
