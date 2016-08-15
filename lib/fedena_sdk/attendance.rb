module FedenaSdk
  class Attendance < Model
    attr_accessor :student_admission_no, :forenoon, :afternoon, :date, :batch_name, :reason

    def self.show(admission_no, options = {})
      date = options[:date]
      attendance_type = options[:attendance_type]
      subject_code = options[:subject_code]
      class_timing_name = options[:class_timing_name]
      url = "/api/attendances/#{admission_no}"
      options = { params: { attendance_type: attendance_type,
                            date: date,
                            subject_code: subject_code,
                            class_timing_name: class_timing_name } }
      hash = get_data_hash(url, options)
      new hash['attendance_detail']['attendance']
    end

    def self.search(query)
      url = '/api/attendances'
      params = { search: query }
      options = { params: params }
      hash = get_data_hash(url, options)
      hash['attendance_detail']['attendance'].map do |attendance_hash|
        new attendance_hash
      end
    end

    def save
      url = '/api/attendances'
      params = attributes_hash
      options = {params: params }
      hash = post_data_hash(url,options)
      new hash['attendance_detail']['attendance']
    end
    
    def self.create(*args)
     attendance = Attendance.new *args
     attendance.save 
    end

    # Overrides
    def attributes_hash
      super.merge({admission_no: @student_admission_no})
    end
  end
end
