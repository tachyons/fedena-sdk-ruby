module FedenaSdk
  class PayrollGroup < Model
    attr_accessor :name, :salary_type, :payment_period, :generation_day, :employee_lop_formula,
                  :employee_overtime_formula, :enable_lop, :payroll_categories
  end
end
