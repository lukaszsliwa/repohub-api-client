class Api::Client::Repository < Api::Client::Base
  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/repositories"
  end
end