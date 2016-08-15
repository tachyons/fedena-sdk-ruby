module FedenaSdk
  class EmployeeAttendance
    attr_accessor :attendance_date, :employee_number, :leave_type, :reason, :half_day

    def search(_query)
      url = '/api/employee_attendances'
      hash = get_data_hash(url)
      hash['attendance_detail']['attendance'].map do |attendance_hash|
        new attendance_hash
      end
    end

    def employee_leave_types(_query)
      url = '/api/employee_leave_types'
      get_data_hash(url)
    end

    def save
      url = '/api/employee_attendances'
      params = attributes_hash
      options = { params: params }
      hash = post_data_hash(url, options)
      new hash['attendance_detail']['attendance']
    end

    def self.create(*args)
      attendance = EmployeeAttendance.new *args
      attendance.save
    end

    def self.destroy(employee_number, date)
      url = "/api/employee_attendances/#{employee_number}"
      params = { date: date }
      options = { params: params }
      request(:delete, url, options)
    end

    # Overrides
    def attributes_hash
      super.merge(leave_type_code: @leave_type)
    end
  end
end
