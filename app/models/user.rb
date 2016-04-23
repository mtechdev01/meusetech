class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :projects, class_name: "Project",foreign_key: "project_id"
  has_many :comments, class_name: "Comment",foreign_key: "comment_id"
  has_many :polls_fields_responses, class_name: "PollsFieldsResponse", foreign_key: "polls_fields_response_id"

  has_many :notifs_received, ->(user) { where receiver:  user.id }, class_name: "Notification"

  has_many :polls_fields, through: :polls_fields_responses

end
