module FedenaSdk
  class BiometricInformation < Model
    attr_accessor :biometric_id,:username,:first_name,:last_name,:role_name

    def self.find(id)
      url = "/api/biometric_informations/#{id}"
      hash = get(url)
      new hash['biometric_detail']['biometric_information']
    end
  end
end
