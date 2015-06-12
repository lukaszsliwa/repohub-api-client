require 'active_support'
require 'active_model'
require 'httparty'
require 'crack'

module Api
  class Client
    extend ActiveSupport::Autoload

    VERSION = '1.0.5'

    def self.configure(&block)
      @configuration = nil
      block.call configuration
    end

    def self.configuration
      @configuration ||= Api::Client::Configuration.new
    end

    def configure(&block)
      @configuration = nil
      block.call configuration
    end

    def configuration
      @configuration ||= Api::Client::Configuration.new
    end

    def within(&block)
      Thread.current[:configuration] = configuration
      begin
        block.call
      ensure
        Thread.current[:configuration] = nil
      end
    end

    autoload :Connection,      'api-client/connection'
    autoload :Request,         'api-client/request'
    autoload :Base,            'api-client/base'
    autoload :Configuration,   'api-client/configuration'
    autoload :Repository,      'api-client/repository'
    autoload :Developer,       'api-client/developer'
    autoload :Key,             'api-client/key'
    autoload :Space,           'api-client/space'
  end
end