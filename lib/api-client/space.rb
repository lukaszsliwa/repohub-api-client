class Api::Client::Space < Api::Client::Base
  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/spaces"
  end
end