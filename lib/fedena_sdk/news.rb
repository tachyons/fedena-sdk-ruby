module FedenaSdk
  class News < Model
    attr_accessor :title, :content, :author
    def self.all(_count = nil)
      url = '/api/news'
      hash = get(url)
      hash['news_detail']['news'].map do |news_hash|
        new news_hash
      end
    end

    def author_user
      User.find(@author)
    end
  end
end
