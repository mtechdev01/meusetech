class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :projects
  has_many :comments
  has_many :pollsResponses, class_name: "PollsFieldsResponse"
  has_many :likes

  has_many :notifs_received, ->(user) { where receiver:  user.id }, class_name: "Notification"

  has_many :polls_fields, through: :polls_fields_responses
  has_many :polls, through: :polls_fields_responses
  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :comments

  def self.to_csv
    attributes = %w{id name city email}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def name
    "#{firstname} #{lastname}"
  end
end
