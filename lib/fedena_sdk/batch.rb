module FedenaSdk
  class Batch < Model
    attr_accessor :name, :course_code, :start_date, :end_date

    def save
      url = self.class.resource_url
      params = attributes_hash
      options = { params: params }
      hash = post(url, options)
      self.class.new hash.first[1].first[1]
    end

    def self.create(*args)
      attendance = Batch.new *args
      attendance.save
    end

    # Overrides
    def attributes_hash
      super.merge(batch_name: name, batch_start_date: start_date, batch_end_date: start_date)
    end
  end
end
