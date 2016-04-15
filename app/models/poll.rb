class Poll < ActiveRecord::Base
  has_many :fields, class_name: "PollsField"
  accepts_nested_attributes_for :fields
end
