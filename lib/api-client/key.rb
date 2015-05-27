class Api::Client::Key < ActiveResource::Base
  self.site = "#{Api::Client.configuration.url_with_version}/users/:user_id"
end