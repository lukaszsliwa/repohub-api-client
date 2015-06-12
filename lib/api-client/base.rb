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

    def configuration
      Thread.current[:configuration] || Api::Client.configuration
    end
  end

  def load(params = {})
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

  def destroy
    Api::Client::Request.delete self.class, id
  end
end