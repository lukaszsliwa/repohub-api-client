class Api::Client::Request
  def self.all(klass, url, params = {}, headers = {})
    response = HTTParty.get(url, query: params, headers: default_headers.merge(headers))
    collections = response.parsed_response
    collections.map do |attributes|
      klass.build_from_response attributes
    end
  end

  def self.find(klass, url, id, params = {}, headers = {})
    response = HTTParty.get "#{url}/#{id}", query: params, headers: default_headers.merge(headers)
    klass.build_from_response response.parsed_response
  end

  def self.create(klass, url, params = {}, headers = {})
    response = HTTParty.post url, query: params, headers: default_headers.merge(headers)
    klass.build_from_response response.parsed_response
  end

  def self.put(klass, url, id, params = {}, headers = {})
    response = HTTParty.put "#{url}/#{id}", query: params, headers: default_headers.merge(headers)
    klass.build_from_response response.parsed_response
  end

  def self.delete(klass, url, id, params = {}, headers = {})
    response = HTTParty.delete "#{url}/#{id}", query: params, headers: default_headers.merge(headers)
    klass.build_from_response response.parsed_response
  end

  def self.default_headers
    { 'API-KEY' => Api::Client.configuration.token }
  end
end