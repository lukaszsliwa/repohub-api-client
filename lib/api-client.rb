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

    autoload :Configuration,  'exec-client/configuration'
    autoload :Repository,     'exec-client/repository'
    autoload :User,           'exec-client/user'
    autoload :Key,            'exec-client/key'
    autoload :Space,          'exec-client/space'
  end
end
