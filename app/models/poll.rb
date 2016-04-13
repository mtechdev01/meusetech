class Poll < ActiveRecord::Base
  has_many :fields, class_name: "PollsField"
  has_many :responses, class_name: "PollsFieldsResponse"
end
