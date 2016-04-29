class Admin::Polls::PollsController < Admin::AdminController

  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
    @usersResponded = Array.new
    PollsFieldsResponse.where(poll_id: params[:id]).group(:user_id).find_each do | user |
      @usersResponded << User.find( user.user.id )
    end
    @userTotal = User.count

    @statsResponse = Array.new
    @poll.fields.each_with_index do | field, index |

      @CountResponse = PollsFieldsResponse.where( polls_field_id: field.id ).count
      @Allresponses = PollsFieldsResponse.where( polls_field_id: field.id ).group(:response)

      @statsResponse[index] = { :label     => field.label, :rsp => Array.new }

      @Allresponses.each do | response |

        if field.options
          @rspFormatted = field.optionsFormated[response.response.to_i]
        else
          @rspFormatted = response.response
        end

        @statsResponse[index][:rsp] << {
          :response  => @rspFormatted,
          :responded => PollsFieldsResponse.where( polls_field_id: field.id, response: response.response.to_s ).count,
          :max       => @CountResponse
        }
      end

    end
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
