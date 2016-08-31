module FedenaSdk
  class Reminder < Model
    attr_accessor :sender, :receiver, :subject, :body, :created_at, :is_read
  end
end
