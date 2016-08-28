module FedenaSdk
  class Model
    def self.attr_accessor(*args)
      @attributes ||= []
      @attributes.concat args
      super(*args)
    end

    class << self
      attr_reader :attributes

      def resource_url(id = nil)
        url = '/api/' + name.split('::').last.underscore.pluralize
        url += "/#{id}" unless id.nil?
        url
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
      self.class.post(*args)
    end

    def get(*args)
      self.class.get(*args)
    end

    def request(*args)
      self.class.request(*args)
    end

    def update_attributes(attrs)
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      update!
    end

    def update!
      params = attributes_hash
      options = { params: params }
      request(:put, self.class.resource_url(id), options)
    end

    module UpdateMethods
    end

    module SearchMethods
    end

    module FindAllMethods
    end
  end
end
