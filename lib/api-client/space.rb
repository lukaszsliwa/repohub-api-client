class Api::Client::Space < Api::Client::Base
  attr_accessor :id, :handle, :name, :created_by_id, :created_at, :updated_at, :repositories_count

  def self.url
    @url ||= "#{configuration.url_with_version}/spaces"
  end
end