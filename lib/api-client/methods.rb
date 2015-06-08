module Api::Client::Methods
  def all(params = {}, headers = {}, from = url)
    Api::Client::Base.all from, params, headers
  end

  def find(id, params = {}, headers = {}, from = url)
    Api::Client::Base.find from, id, params, headers
  end

  def create(params = {}, headers = {}, from = url)
    Api::Client::Base.create from, params, headers
  end

  def put(id, params = {}, headers = {}, from = url)
    Api::Client::Base.put from, id, params, headers
  end

  def delete(id, params = {}, headers = {}, from = url)
    Api::Client::Base.delete from, id, params, headers
  end
end