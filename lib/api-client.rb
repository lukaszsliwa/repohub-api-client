require 'active_support'
require 'active_resource'

module Api
  module Client
    extend ActiveSupport::Autoload

    VERSION = '1.0.0'

    def self.configure(&block)
      block.call configuration
    end

    def self.configuration
      @configuration ||= Api::Client::Configuration.new
    end

    autoload :Configuration,  'api-client/configuration'
    autoload :Repository,     'api-client/repository'
    autoload :User,           'api-client/user'
    autoload :Key,            'api-client/key'
    autoload :Space,          'api-client/space'
  end
end
