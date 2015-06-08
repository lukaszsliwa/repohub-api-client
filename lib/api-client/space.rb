class Api::Client::Space
  extend Api::Client::Methods

  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/spaces"
  end
end