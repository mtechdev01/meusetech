module Meusetech

  class Notifiable

    def initialize(data)
      @data = data
    end

    def notif
      saveNotif User.find @data[:receiver]
      toAdmin
      if @data[:model] == "Project"
        toFollower
      end
    end

    private

    def toAdmin
      if @data[:sender] != @data[:receiver]
        User.where(is_admin: true).find_each do | admin |
          if @data[:receiver].to_i != admin.id
            saveNotif admin
          end
        end
      end
    end

    def toFollower
      if @data[:sender] != @data[:receiver]
        @follow = ProjectsFollower.where(project_id: @data[:key]).find_each do | follower |
          if follower.user_id != @data[:receiver] &&  follower.user_id != @data[:sender] && follower.user.is_admin != true
            saveNotif follower.user
          end

        end

      end
    end

    def saveNotif receiver
      if @data[:sender] != @data[:receiver]
        @notif = Notification.new
        @notif.model    = @data[:model]
        @notif.key      = @data[:key]
        @notif.sender   = User.find @data[:sender]
        @notif.receiver = receiver
        @notif.msg      = @data[:msg]
        @notif.save
      end
    end
  end

end
