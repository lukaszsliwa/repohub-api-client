class Api::Client::Developer < Api::Client::Base
  extend ActiveSupport::Autoload

  self.site = Api::Client.configuration.url_with_version

  def self.allow(developer_id, space_id, repository_id)
    Api::Client::Developer::Repository.put(repository_id, developer_id: developer_id, space_id: space_id)
  end

  def self.deny(developer_id, space_id, repository_id)
    Api::Client::Developer::Repository.delete(repository_id, developer_id: developer_id, space_id: space_id)
  end

  autoload :Repository, 'api-client/developer/repository'
end