module FedenaSdk
  class User < Model
    attr_accessor :type, :username, :email, :full_name
    def self.find(username)
      url = "/api/users/#{username}"
      hash = get(url)
      new hash['user_detail']['user']
    end
  end
end
