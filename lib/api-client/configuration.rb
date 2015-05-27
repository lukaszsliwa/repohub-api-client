class Api::Client::Configuration
  attr_accessor :url, :version

  def self.url_with_version
    @url_with_version ||= [url, version].join '/'
  end
end