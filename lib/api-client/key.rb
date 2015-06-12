class Api::Client::Key < Api::Client::Base
  attr_accessor :id, :user_id, :token, :content, :created_at, :updated_at

  def self.url
    @url ||= "#{configuration.url_with_version}/keys"
  end
end