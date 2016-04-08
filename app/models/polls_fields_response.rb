class PollsFieldsResponse < ActiveRecord::Base
  belongs_to :polls_field, class_name: "PollsField",
                        foreign_key: "polls_field_id"
  belongs_to :poll, class_name: "Poll",
                        foreign_key: "poll_id"
  belongs_to :user, class_name: "User",
                        foreign_key: "user_id"
end
