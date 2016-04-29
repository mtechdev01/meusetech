class PollsFieldsResponse < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :field, class_name: "PollsField",
                        foreign_key: "polls_field_id"
  belongs_to :poll, class_name: "Poll",
                        foreign_key: "poll_id"
  belongs_to :user, class_name: "User",
                        foreign_key: "user_id"

  def self.responsed user
    where(user_id: user.id ).group(:poll_id).order( created_at: :desc)
  end

  def self.statsResponse response
    where( polls_field_id: response.polls_field_id, poll_id: response.poll_id, response: response.response ).count
  end
  def self.groupedByResponse
    group(:response)
  end
end
