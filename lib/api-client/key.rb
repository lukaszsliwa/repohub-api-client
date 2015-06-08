class Api::Client::Key
  extend Api::Client::Methods

  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/keys"
  end
end