class Notification < ActiveRecord::Base

  belongs_to :comment, -> { where model: 'Comment' }, class_name: "Comment", foreign_key: "key"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver"
  belongs_to :sender, class_name: "User", foreign_key: "sender"

end
