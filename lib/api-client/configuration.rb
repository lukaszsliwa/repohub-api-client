class Api::Client::Configuration
  attr_accessor :url, :version, :token

  def url_with_version
    @url_with_version ||= [url, version].join '/'
  end

  def default_headers
    { 'API-KEY' => self.token }
  end
end