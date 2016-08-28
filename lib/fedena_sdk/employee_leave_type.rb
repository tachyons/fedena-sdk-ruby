module FedenaSdk
  class EmployeeLeaveType < Model
    RESOURCE_URL = '/api/employee_leave_types'.freeze
    attr_accessor :name, :carry_forward, :carry_forward_type, :code, :creation_status, :is_active,
                  :lop_enabled, :max_carry_forward_leaves, :max_leave_count, :reset_date

    def self.all
      hash = get RESOURCE_URL
      hash.first[1].first[1].map do |category|
        new category
      end
    end
  end
end
