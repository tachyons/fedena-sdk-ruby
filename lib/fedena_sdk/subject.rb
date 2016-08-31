module FedenaSdk
  class Subject < Model
    attr_accessor :name, :code, :batch, :no_exams, :max_weekly_classes, :credit_hours,
                  :elective_group, :assigned_students, :assigned_employees
  end
end
