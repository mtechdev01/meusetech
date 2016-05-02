class Poll < ActiveRecord::Base
  has_many :fields, class_name: "PollsField", dependent: :delete_all
  has_many :responses, class_name: 'PollsFieldsResponse', foreign_key: "poll_id", dependent: :delete_all
  accepts_nested_attributes_for :fields

  def nbUsersResponded
    responses.group(:user_id).count
  end

end
