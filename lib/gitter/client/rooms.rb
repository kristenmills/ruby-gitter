module Gitter
  class Client
    module Rooms
      def rooms
        self.class.get("/rooms", { headers: @headers })
      end
    end
  end
end