class Api::Client::Configuration
  attr_accessor :url, :version, :access_token, :refresh_token, :client_id, :client_secret, :redirect_uri

  def url_with_version
    @url_with_version ||= [url, version].join '/'
  end

  def client
    @client ||= OAuth2::Client.new(client_id, client_secret, {site: url})
  end

  def code
    client.auth_code.authorize_url(redirect_uri: redirect_uri)
  end

  def api
    @api ||= OAuth2::AccessToken.new(client, access_token, refresh_token: refresh_token)
  end

  def default_headers
    new_access_token = api.refresh!(redirect_uri: redirect_uri)
    self.access_token, self.refresh_token = new_access_token.token, new_access_token.refresh_token
    { 'AUTHORIZATION' => "Bearer #{self.access_token}" }
  end
end