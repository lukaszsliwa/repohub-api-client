class Api::Client::Developer
  extend ActiveSupport::Autoload
  extend Api::Client::Methods

  def self.url
    @url ||= "#{Api::Client.configuration.url_with_version}/developers"
  end

  def self.allow(developer_id, space_id, repository_id, headers = {}, from = nil)
    from = "#{url}/#{developer_id}/repositories" if from.nil?
    Api::Client::Developer::Repository.put(repository_id, {developer_id: developer_id, space_id: space_id}, headers, from)
  end

  def self.deny(developer_id, space_id, repository_id, headers = {}, from = nil)
    from = "#{url}/#{developer_id}/repositories" if from.nil?
    Api::Client::Developer::Repository.delete(repository_id, {developer_id: developer_id, space_id: space_id}, headers, from)
  end

  autoload :Repository, 'api-client/developer/repository'
end