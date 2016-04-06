class PollsField < ActiveRecord::Base
  self.table_name = "Polls_fields"
  belongs_to :poll
  has_many :responses, class_name: "PollsFieldsResponse",
                        foreign_key: "Polls_field_id"
end
