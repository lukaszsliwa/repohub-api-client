class Api::Client::Repository < Api::Client::Base
  self.site = Api::Client.configuration.url_with_version
end