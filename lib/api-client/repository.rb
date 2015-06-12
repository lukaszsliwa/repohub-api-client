class Api::Client::Repository < Api::Client::Base
  def self.url
    @url ||= "#{configuration.url_with_version}/repositories"
  end
end