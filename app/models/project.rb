class Project < ActiveRecord::Base
  has_many :comments, class_name: "ProjectsComment",
                          foreign_key: "project_id"
  has_many :followers, class_name: "ProjectsFollower",
                          foreign_key: "project_id"
  belongs_to :user
end
