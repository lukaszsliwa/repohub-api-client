class Api::Client::Request
  def self.all(klass, params = {}, url = nil)
    url ||= klass.url
    response = HTTParty.get(url, query: params, headers: configuration.default_headers)
    collections = response.parsed_response
    collections.map do |attributes|
      klass.build_from_response attributes
    end
  end

  def self.find(klass, id, params = {}, url = nil)
    url ||= "#{klass.url}/#{id}"
    response = HTTParty.get url, query: params, headers: configuration.default_headers
    klass.build_from_response response.parsed_response
  end

  def self.create(klass, params = {}, url = nil)
    url ||= klass.url
    response = HTTParty.post url, query: params, headers: configuration.default_headers
    klass.build_from_response response.parsed_response
  end

  def self.put(klass, id, params = {}, url = nil)
    url ||= "#{klass.url}/#{id}"
    response = HTTParty.put url, query: params, headers: configuration.default_headers
    klass.build_from_response response.parsed_response
  end

  def self.delete(klass, id, params = {}, url = nil)
    url ||= "#{klass.url}/#{id}"
    response = HTTParty.delete url, query: params, headers: configuration.default_headers
    klass.build_from_response response.parsed_response
  end

  def self.configuration
    Thread.current[:configuration] || Api::Client.configuration
  end
end