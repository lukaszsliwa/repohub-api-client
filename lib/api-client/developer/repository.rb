class Api::Client::Developer::Repository  < Api::Client::Base
  def self.url(developer_id)
    @url ||= "#{configuration.url_with_version}/developers/#{developer_id}/repositories"
  end
end