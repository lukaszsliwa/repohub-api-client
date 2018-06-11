class Api::Client::Developer < Api::Client::Base
  extend ActiveSupport::Autoload

  attr_accessor :id, :login, :first_name, :last_name, :email, :created_by_id, :created_at, :updated_at, :token, :admin, :repositories_count, :keys_count

  def self.url
    @url ||= "#{configuration.url_with_version}/developers"
  end

  def to_param
    login
  end

  def self.allow(developer_id, handle_with_space)
    space, repository_id = Api::Client::Repository.split_handle(handle_with_space)
    url = Api::Client::Developer::Repository.url(developer_id)
    Api::Client::Developer::Repository.create(space_handle: space, repository_id: repository_id, developer_id: developer_id, url: url)
  end

  def self.deny(developer_id, handle_with_space)
    space, repository_id = Api::Client::Repository.split_handle(handle_with_space)
    url = Api::Client::Developer::Repository.url(developer_id)
    Api::Client::Developer::Repository.delete(developer_id, {space_handle: space, repository_id: repository_id, url: url})
  end

  autoload :Repository, 'api-client/developer/repository'
end