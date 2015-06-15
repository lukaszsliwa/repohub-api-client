class Api::Client::Repository < Api::Client::Base
  attr_accessor :id, :handle, :name, :space_handle, :handle_with_space, :path, :allowed, :users_count, :users, :created_by_id, :created_at, :updated_at

  def self.url
    @url ||= "#{configuration.url_with_version}/repositories"
  end

  def to_param
    handle
  end

  def destroy
    Api::Client::Request.delete(Api::Client::Repository, handle, {space_handle: space_handle})
  end

  def self.split_handle(handle)
    items = (handle || '').split '/'
    case items.size
      when 0
        space_handle = repository_id = nil
      when 1
        space_handle, repository_id = nil, items[0]
      else
        space_handle, repository_id = items[0], items[1]
    end
    return space_handle, repository_id
  end
end