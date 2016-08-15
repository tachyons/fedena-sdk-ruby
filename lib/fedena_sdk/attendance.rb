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
  end
end
