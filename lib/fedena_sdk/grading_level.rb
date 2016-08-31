module FedenaSdk
  class GradingLevel < Model
    attr_accessor :name, :batch, :min_score, :is_deleted, :credit_points, :description
  end
end
