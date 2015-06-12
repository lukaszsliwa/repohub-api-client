class Api::Client::Key < Api::Client::Base
  def self.url
    @url ||= "#{configuration.url_with_version}/keys"
  end
end