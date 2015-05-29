require "digest/sha1"

class Api::Client::Configuration
  attr_accessor :url, :version, :authorization_key, :secret_token

  def url_with_version
    @url_with_version ||= [url, version].join '/'
  end

  def api_key
    @api_key ||= Digest::SHA1.hexdigest("#{authorization_key}#{secret_token}")
  end
end