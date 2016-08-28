module FedenaSdk
  class Student < Model
    attr_accessor :student_name, :batch_name, :roll_number, :admission_date, :blood_group, :gender, :nationality, :language, :category, :religion, :address, :city, :state, :country, :phone, :mobile, :email, :biometric_id, :is_sms_enabled, :is_email_enabled, :photo, :immediate_contact, :student_additional_details
    def self.search(query)
      url = '/api/students'
      params = { search: query }
      options = { params: params }
      hash = get(url, options)
      hash['student_detail']['student'].map do |student_hash|
        new student_hash
      end
    end

    def self.find(admission_no)
      url = "/api/students/#{admission_no}"
      hash = get(url)
      new hash['student_detail']['student']
    end

    def user
      User.find(admission_no)
    end
  end
end
