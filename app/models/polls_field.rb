class PollsField < ActiveRecord::Base

  belongs_to :poll, class_name: "Poll",
                        foreign_key: "poll_id"
  has_many :responses, class_name: "PollsFieldsResponse",
                        foreign_key: "polls_fields_response_id"
end
