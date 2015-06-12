class Api::Client::Developer < Api::Client::Base
  extend ActiveSupport::Autoload

  def self.url
    @url ||= "#{configuration.url_with_version}/developers"
  end

  def self.allow(developer_id, space_id, repository_id)
    Api::Client::Developer::Repository.create(space_id: space_id, repository_id: repository_id, developer_id: developer_id)
  end

  def self.deny(developer_id, space_id, repository_id)
    Api::Client::Developer::Repository.delete(developer_id, repository_id, {space_id: space_id, repository_id: repository_id})
  end

  autoload :Repository, 'api-client/developer/repository'
end