module FedenaSdk
  class Model
    def self.attr_accessor(*args)
      @attributes ||= []
      @attributes.concat args
      super(*args)
    end

    class << self
      attr_reader :attributes
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
      xml = FedenaSdk.access_token.request(verb, url, options).body
      Hash.from_xml xml
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
