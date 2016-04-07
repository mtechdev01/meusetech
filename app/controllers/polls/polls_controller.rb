class Polls::PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
    @questions = PollsField.all
    @questions.each do | question |
      if question.options != nil
        @options = question.options.split(',').map(&:to_s)
      end
    end
    #@options = @questions.options
  end

end
