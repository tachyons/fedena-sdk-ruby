module FedenaSdk
  class FedenaSdkError < StandardError
  end

  class ResourceNotFound < FedenaSdkError
  end

  class InvalidRequest < FedenaSdkError
  end

  class AccessTokenNotSet < FedenaSdkError
  end

  class ClientNotSet < FedenaSdkError
  end
end
