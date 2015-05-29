class Api::Client::Base < ActiveResource::Base
  headers['api_key'] = Api::Client.configuration.api_key
end