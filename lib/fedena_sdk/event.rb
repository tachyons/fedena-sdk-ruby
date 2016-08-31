module FedenaSdk
  class Event < Model
    attr_accessor :title, :description, :start_date, :end_date, :is_holiday, :is_exam, :is_due
    def search(username, start_date, end_date)
    end
  end
end
