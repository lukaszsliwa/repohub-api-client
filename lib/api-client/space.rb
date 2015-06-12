class Api::Client::Space < Api::Client::Base
  def self.url
    @url ||= "#{configuration.url_with_version}/spaces"
  end
end