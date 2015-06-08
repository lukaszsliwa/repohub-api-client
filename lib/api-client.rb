require 'active_support'
require 'httparty'
require 'crack'

module Api
  module Client
    extend ActiveSupport::Autoload

    VERSION = '1.0.1'

    def self.configure(&block)
      @configuration = nil
      block.call configuration
    end

    def self.configuration
      @configuration ||= Api::Client::Configuration.new
    end

    autoload :Methods,        'api-client/methods'
    autoload :Base,           'api-client/base'
    autoload :Configuration,  'api-client/configuration'
    autoload :Repository,     'api-client/repository'
    autoload :Developer,      'api-client/developer'
    autoload :Key,            'api-client/key'
    autoload :Space,          'api-client/space'
  end
end