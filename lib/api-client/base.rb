class Api::Client::Base
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Translation

  class << self
    def all(params = {}, headers = {}, from = url)
      Api::Client::Request.all self, from, params, headers
    end

    def find(id, params = {}, headers = {}, from = url)
      Api::Client::Request.find self, from, id, params, headers
    end

    def create(params = {}, headers = {}, from = url)
      Api::Client::Request.create self, from, params, headers
    end

    def put(id, params = {}, headers = {}, from = url)
      Api::Client::Request.put self, from, id, params, headers
    end

    def delete(id, params = {}, headers = {}, from = url)
      Api::Client::Request.delete self, from, id, params, headers
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
  end

  def done?
    errors.messages.empty?
  end
end