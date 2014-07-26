require "httparty"
require "gitter/client/rooms"

module Gitter
  class Client
    include HTTParty
    include Gitter::Client::Rooms

    base_uri "https://api.gitter.im/v1"

    def initialize(token)
      @headers =  {
                    "Content-Type" => "application/json",
                    "Accept" => "application/json",
                    "Authorization" => "Bearer #{token}"
                  }
    end
  end
end