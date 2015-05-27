class Api::Client::Configuration
  attr_accessor :url, :version

  def url_with_version
    @url_with_version ||= [url, version].join '/'
  end
end