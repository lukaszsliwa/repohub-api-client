class Api::Client::Developer < ActiveResource::Base
  self.site = Api::Client.configuration.url_with_version
end