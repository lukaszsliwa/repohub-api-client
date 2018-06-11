class Api::Client::Base
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Translation

  attr_accessor :message, :request, :errors

  def initialize(params = {})
    load params
  end

  class << self
    def all(params = {})
      url = params.delete :url
      Api::Client::Request.all self, params, url
    end

    def find(id, params = {})
      url = params.delete :url
      Api::Client::Request.find self, id, params, url
    end

    def create(params = {})
      url = params.delete :url
      Api::Client::Request.create self, params, url
    end

    def put(id, params = {})
      url = params.delete :url
      Api::Client::Request.put self, id, params, url
    end

    def delete(id, params = {})
      url = params.delete :url
      Api::Client::Request.delete self, id, params, url
    end

    def configuration
      Thread.current[:configuration] || Api::Client.configuration
    end
  end

  def load(params = {})
    params ||= {}
    @errors = ActiveModel::Errors.new self
    @params = params.dup
    if (errors_ = params.delete 'errors').present?
      errors_.each do |key, values|
        values.each { |value| errors[key] << value }
      end
    end
    params.each do |key, value|
      self.send("#{key}=".to_sym, value)
    end
  end

  def attributes
    @params || {}
  end

  def inspect
    "#<#{self.class} #{attributes.map { |key, value| "#{key}=\"#{value}\""}.join(' ')}>"
  end

  def to_param
    id
  end

  def destroy
    Api::Client::Request.delete self.class, to_param
  end
end