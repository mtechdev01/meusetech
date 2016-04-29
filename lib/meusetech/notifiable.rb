module Meusetech

  class Notifiable

    def initialize(data)
      @data = data
    end

    def notif
      saveNotif User.find @data[:receiver]
      toAdmin
    end

    private

    def toAdmin
      User.where(is_admin: true).find_each do | admin |
        if @data[:receiver].to_i != admin.id
          saveNotif admin
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
