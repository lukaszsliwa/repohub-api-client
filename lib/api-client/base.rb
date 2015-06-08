class Api::Client::Base
  def self.all(url, params = {}, headers = {})
    response = HTTParty.get(url, query: params, headers: default_headers.merge(headers))
    collections = response.parsed_response
    collections.values.first.map do |attributes|
      OpenStruct.new attributes
    end
  end

  def self.find(url, id, params = {}, headers = {})
    response = HTTParty.get "#{url}/#{id}", query: params, headers: default_headers.merge(headers)
    OpenStruct.new response.parsed_response
  end

  def self.create(url, params = {}, headers = {})
    response = HTTParty.post url, query: params, headers: default_headers.merge(headers)
    OpenStruct.new response.parsed_response
  end

  def self.put(url, id, params = {}, headers = {})
    response = HTTParty.put "#{url}/#{id}", query: params, headers: default_headers.merge(headers)
    OpenStruct.new response.parsed_response
  end

  def self.delete(url, id, params = {}, headers = {})
    response = HTTParty.delete "#{url}/#{id}", query: params, headers: default_headers.merge(headers)
    OpenStruct.new response.parsed_response
  end

  def self.default_headers
    { 'API-KEY' => Api::Client.configuration.token }
  end
end