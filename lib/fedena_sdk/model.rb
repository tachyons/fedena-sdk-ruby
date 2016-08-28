module FedenaSdk
  class Model
    def self.attr_accessor(*args)
      @attributes ||= []
      @attributes.concat args
      super(*args)
    end

    class << self
      attr_reader :attributes

      def resource_url
        '/api/' + name.split('::').last.underscore.pluralize
      end

      def all
        hash = get resource_url
        hash.first[1].first[1].map do |item|
          new item
        end
      end

      def search(query)
        params = { search: query }
        options = { params: params }
        hash = get(resource_url, options)
        hash.first[1].first[1].map do |item|
          new item
        end
      end
    end

    def attributes
      self.class.attributes
    end

    def attributes_hash
      attributes.map { |attribute| { attribute => send(attribute) } }.reduce({}, :merge)
    end

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    # FIXME: better name for this method
    def self.get(url, options = {})
      request(:get, url, options)
    end

    def self.post(url, options = {})
      request(:post, url, options)
    end

    def self.request(verb, url, options = {})
      raise AccessTokenNotSet if FedenaSdk.access_token.nil?
      xml = FedenaSdk.access_token.request(verb, url, options).body
      hash = Hash.from_xml xml
      raise InvalidRequest if hash.keys.include? 'errors'
      hash
    end

    def post(*args)
      self.class.post *args
    end

    def get(*args)
      self.class.get *args
    end

    def request
      self.class.request *args
    end
  end
end
