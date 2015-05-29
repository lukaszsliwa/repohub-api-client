class Api::Client::Base < ActiveResource::Base
  self.headers['API-KEY'] = Api::Client.configuration.api_key
end