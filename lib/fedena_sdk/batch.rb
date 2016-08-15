module FedenaSdk
  class Batch < Model
    attr_accessor :name, :course_code, :start_date, :end_date

    def self.search(query)
      url = '/api/batches'
      params = { search: query }
      options = { params: params }
      hash = get(url, options)
      hash['batch_detail']['batch'].map do |batch_hash|
        new batch_hash
      end
    end
  end
end
