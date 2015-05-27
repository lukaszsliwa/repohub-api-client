class Api::Client::Space < ActiveResource::Base
  self.site = Api::Client.configuration.url_with_version
end