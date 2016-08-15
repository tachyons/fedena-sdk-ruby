module FedenaSdk
  class Course < Model
    attr_accessor :course_name, :course_code, :section_name, :grading_type

    def self.all
      url = '/api/courses'
      hash = get(url)
      hash['course_detail']['course'].map do |course_hash|
        new course_hash
      end
    end
  end
end
