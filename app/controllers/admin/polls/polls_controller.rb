class Admin::Polls::PollsController < Admin::AdminController

  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def edit
    #code
  end

  def create
    #code
  end

  def delete
    #code
  end

end
