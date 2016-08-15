module FedenaSdk
  class School < Model
    attr_accessor :institute_name, :institute_address, :institute_phone, :institute_language, :institute_currency, :institute_time_zone, :image

    def self.current_school
      url = '/api/schools'
      hash = get(url)
      new hash['school_detail']['school']
    end
  end
end
