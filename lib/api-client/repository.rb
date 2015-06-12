class Api::Client::Repository < Api::Client::Base
  attr_accessor :id, :handle, :name, :space_id, :handle_with_space, :path, :allowed, :users_count

  def self.url
    @url ||= "#{configuration.url_with_version}/repositories"
  end
end