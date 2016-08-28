require 'fedena_sdk/version'
require 'fedena_sdk/errors'
require 'fedena_sdk/client'
require 'fedena_sdk/model'
require 'active_support/all'

module FedenaSdk
  extend ActiveSupport::Autoload
  autoload :User
  autoload :School
  autoload :Attendance
  autoload :EmployeeAttendance
  autoload :Course
  autoload :Batch
  autoload :Student
  autoload :BiometricInformation
  autoload :Employee
  autoload :EmployeeCategory
  autoload :EmployeeDepartment
  autoload :EmployeeGrade
  autoload :EmployeeLeaveType
  autoload :EmployeePosition
  autoload :Event
  autoload :ExamGroup
  autoload :ExamScore
  autoload :FinanceTransaction
  autoload :GradingLevel
  autoload :News
  autoload :Payroll
  autoload :PayrollGroup
  autoload :Reminder
  autoload :StudentCategory
  autoload :Subject
  autoload :Timetable

  class << self
    attr_accessor :client, :access_token

    def authenticate(options = {})
      @client = FedenaSdk::Client.new options
      @oauth2_client = @client.oauth2_client
      @client
    end

    def access_token_from_auth_code(auth_code, redirect_uri)
      raise ClientNotSet if @oauth2_client.nil?
      @access_token ||= @oauth2_client.auth_code.get_token(auth_code, { redirect_uri: redirect_uri }, header_format: 'Token token="%s"')
    end

    def access_token_from_password(username, password, redirect_uri)
      raise ClientNotSet if @oauth2_client.nil?
      @access_token ||= @oauth2_client.password.get_token(username, password, { redirect_uri: redirect_uri }, header_format: 'Token token="%s"')
    end

    def refresh_access_token!
      @access_token = @access_token.refresh!
    end

    def current_user
      FedenaSdk::User.new(@access_token.params['user_info'])
    end
  end
end
