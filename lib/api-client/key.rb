class Api::Client::Key < ActiveResource::Base
  self.site = "#{Api::Client.configuration.url_with_version}/developers/:developer_id"
end