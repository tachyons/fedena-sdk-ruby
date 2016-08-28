module FedenaSdk
  class ExamGroup < Model
    attr_accessor :batch, :exam_date, :exam_category, :exam_type, :is_published, :name
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
