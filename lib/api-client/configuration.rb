class Api::Client::Configuration
  attr_accessor :url, :version, :token

  def url_with_version
    @url_with_version ||= [url, version].join '/'
  end

  def api_key
    @api_key ||= self.token
  end
end