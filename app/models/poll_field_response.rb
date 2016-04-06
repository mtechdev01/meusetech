class PollFieldResponse < ActiveRecord::Base
  belongs_to :poll_field
  #belongs_to :poll_field_id
  has_many :users
end
