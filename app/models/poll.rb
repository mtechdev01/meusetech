class Poll < ActiveRecord::Base
  has_many :fields, class_name: "PollsField",
                        foreign_key: "poll_id"
  has_many :responses, class_name: "PollsFieldResponse",
                        foreign_key: "poll_id"
end
