require 'fedena_sdk/version'
require 'fedena_sdk/errors'
require 'fedena_sdk/client'
require 'fedena_sdk/model'
require 'active_support/all'

module FedenaSdk
  extend ActiveSupport::Autoload
  autoload :User
  autoload :News
  autoload :School
  autoload :Attendance
  autoload :EmployeeAttendance
  autoload :Course
  autoload :Batch
  autoload :Student
  class << self
    attr_accessor :client, :access_token

    def authenticate(options = {})
      @client = FedenaSdk::Client.new options
      @oauth2_client = @client.oauth2_client
      @client
    end

    def access_token_from_auth_code(auth_code, redirect_uri)
      @access_token ||= @oauth2_client.auth_code.get_token(auth_code, { redirect_uri: redirect_uri }, header_format: 'Token token="%s"')
    end

    def access_token_from_password(username, password, redirect_uri)
      @access_token ||= @oauth2_client.password.get_token(username, password, { redirect_uri: redirect_uri }, header_format: 'Token token="%s"')
    end

    def current_user
      FedenaSdk::User.new(@access_token.params['user_info'])
    end
   end
end
