class Api::Client::Base < ActiveResource::Base
  def self.headers
    @headers ||= {'api_key': Api::Client.configuration.api_key}
  end
end