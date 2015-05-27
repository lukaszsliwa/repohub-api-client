class Api::Client::Repository < ActiveResource::Base
  self.site = Api::Client.configuration.url_with_version
end