module Meusetech

  class Notifiable

    def initialize(data)
      @data = data
    end

    def notif
      receiver = User.find @data[:receiver]
      sender = User.find @data[:sender]
      saveNotif receiver, sender
      toAdmin receiver, sender
      if @data[:model] == "Project"
        toFollower receiver, sender
      end
    end

    private

    def toAdmin receiver, sender
      if sender != receiver
        User.where(is_admin: true).find_each do | admin |
          if @data[:receiver].to_i != admin.id
            saveNotif admin, sender
          end
        end
      end
    end

    def toFollower receiver, sender
      if sender != receiver
        @follow = ProjectsFollower.where(project_id: @data[:key]).find_each do | follower |
          if follower.user_id != @data[:receiver] &&  follower.user_id != @data[:sender] && follower.user.is_admin != true
            saveNotif follower.user, sender
          end

        end

      end
    end

    def saveNotif receiver, sender
      if sender != receiver
        @notif = Notification.new
        @notif.model    = @data[:model]
        @notif.key      = @data[:key]
        @notif.sender   = sender
        @notif.receiver = receiver
        @notif.msg      = @data[:msg]
        @notif.save
      end
    end
  end

end
