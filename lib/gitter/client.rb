require 'httparty'
module Gitter
  class Client
    include HTTParty

    base_uri 'api.gitter.im'

    def initialize(token)
      @headers =  {
                    'Content-Type' => 'application/json',
                    'Accept' => 'application/json',
                    'Authorization' => "Bearer #{token}"
                  }
    end
  end
end