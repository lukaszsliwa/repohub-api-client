class Api::Client::Repository
  extend Api::Client::Methods

  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/repositories"
  end
end