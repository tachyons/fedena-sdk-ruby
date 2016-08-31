module FedenaSdk
  class Payroll < Model
    attr_accessor :payroll_group, :gross_salary, :earning, :total_earning, :deduction, :total_deduction, :net_pay
  end
end
