class Api::Client::Base
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Translation

  class << self
    def all(params = {})
      Api::Client::Request.all self, params
    end

    def find(id, params = {})
      Api::Client::Request.find self, id, params
    end

    def create(params = {})
      Api::Client::Request.create self, params
    end

    def put(id, params = {})
      Api::Client::Request.put self, id, params
    end

    def delete(id, params = {})
      Api::Client::Request.delete self, id, params
    end

    def build_from_response(params = {})
      object = new
      object.define_singleton_method(:errors) do
        @errors ||= ActiveModel::Errors.new(object)
      end
      object.define_singleton_method(:attributes) { params.dup }
      object.define_singleton_method(:inspect) do
        "#<#{self.class} #{method(:attributes).call.map { |key, value| "#{key}=\"#{value}\""}.join(' ')}>"
      end
      if (errors = params.delete 'errors').present?
        errors.each do |key, values|
          values.each { |value| object.errors[key] << value }
        end
      end
      params.each do |key, value|
        object.define_singleton_method(key.to_sym) do
          Integer(value) rescue nil || JSON.parse(value) rescue nil || value
        end
      end
      object
    end

    def configuration
      Thread.current[:configuration] || Api::Client.configuration
    end
  end

  def done?
    errors.messages.empty?
  end
end