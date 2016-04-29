class Poll < ActiveRecord::Base
  has_many :fields, class_name: "PollsField"
  has_many :responses, class_name: 'PollsFieldsResponse', foreign_key: "poll_id"
  accepts_nested_attributes_for :fields

  def nbUsersResponded
    responses.group(:user_id).count
  end

end
