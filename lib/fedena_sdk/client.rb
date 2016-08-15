require 'oauth2'

module FedenaSdk
  class Client
    attr_accessor :client_id, :access_token, :client_secret, :redirect_uri, :uri

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    def oauth2_client
      @client ||= OAuth2::Client.new(@client_id, @client_secret, site: @uri)
    end

    def authorize_uri
      oauth2_client.auth_code.authorize_url(redirect_uri: @redirect_uri)
    end

    def method_missing(method, *args)
      oauth2_client.send(method, *args)
    end
  end
end
