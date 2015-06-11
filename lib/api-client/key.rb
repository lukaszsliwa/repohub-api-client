class Api::Client::Key < Api::Client::Base
  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/keys"
  end
end