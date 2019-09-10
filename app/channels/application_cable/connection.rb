module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_chef

    def connect
      logger.debug 'Connection#connect'
      self.current_chef = find_verified_chef
    end

    def disconnect
      logger.debug 'Connection#disconnect'
    end

    private

    def find_verified_chef
      if verified_user = Chef.find_by(id: cookies.encrypted[:chef_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
