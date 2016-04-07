class Poll < ActiveRecord::Base
  has_many :fields, class_name: "PollsField",
                        foreign_key: "polls_field_id"
  has_many :responses, class_name: "PollsFieldsResponse",
                        foreign_key: "polls_fields_response_id"
end
