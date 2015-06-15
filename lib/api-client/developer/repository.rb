class Api::Client::Developer::Repository  < Api::Client::Base
  attr_accessor :id, :developer_id, :repository_id, :space_handle

  def self.url(developer_id)
    @url ||= "#{configuration.url_with_version}/developers/#{developer_id}/repository"
  end
end