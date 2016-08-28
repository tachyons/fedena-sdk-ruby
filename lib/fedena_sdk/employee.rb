module FedenaSdk
  class Employee < Model
    attr_accessor :employee_name, :joining_date, :employee_department, :employee_category, :employee_position,
                  :employee_grade, :job_titile, :reporting_manager, :gender, :email, :status, :qualification, :total_experiance,
                  :experiance_info, :date_of_birth, :martial_status, :children_count, :mother_name, :father_name,
                  :spouse_name, :blood_group, :nationality, :biometric_id, :home_address, :city, :state, :country, :pin_code,
                  :office_address, :office_city, :office_country, :office_pin_code, :office_phone1, :office_phone2,
                  :mobile, :home_phone, :fax, :foto
  end
end
