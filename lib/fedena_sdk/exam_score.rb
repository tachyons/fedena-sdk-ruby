module FedenaSdk
  class ExamScore < Model
    attr_accessor :student, :exam_group, :batch, :subject, :marks, :grading_level, :remarks

    def save
      url = self.class.resource_url
      params = attributes_hash
      options = { params: params }
      hash = post(url, options)
      self.class.new hash.first[1].first[1]
    end

    def self.create(*args)
      attendance = ExamGroup.new(*args)
      attendance.save
    end
  end
end
