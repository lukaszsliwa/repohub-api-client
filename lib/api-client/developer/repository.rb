class Api::Client::Developer::Repository  < Api::Client::Base
  def self.url(developer_id)
    @url ||= "#{Api::Client.configuration.url_with_version}/developers/#{developer_id}"
  end
end