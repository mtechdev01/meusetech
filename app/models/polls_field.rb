class PollsField < ActiveRecord::Base

  belongs_to :poll, class_name: "Poll",
                        foreign_key: "poll_id"
  has_many :responses, class_name: "PollsFieldsResponse"
  has_many :user, through: :polls_fields_responses

  accepts_nested_attributes_for :responses


  def optionsFormated
    if self.options != nil
      return self.options.split(",").map(&:to_s)
    end
  end


  def getResponse
    return self.responses.groupedByResponse
  end

  def rulesFormated
    if self.rules != nil
      return self.rules.remove(",")
    end
  end

end
