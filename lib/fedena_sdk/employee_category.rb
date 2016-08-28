module FedenaSdk
  class EmployeeCategory < Model
    RESOURCE_URL = '/api/employee_categories'.freeze
    attr_accessor :name, :prefix

    def self.all
      hash = get RESOURCE_URL
      hash['employee_category_detail']['employee_category'].map do |category|
        new category
      end
    end
  end
end
