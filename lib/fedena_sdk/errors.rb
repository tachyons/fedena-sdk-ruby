module FedenaSdk

  class FedenaSdkError < StandardError
  end

  class ResourceNotFound < FedenaSdkError
  end

  class InvalidRequest < FedenaSdkError
  end
end
