require_relative '../../spec/spec_helper.rb'

describe Api::Client do
  describe '.configure' do
    it 'should configure an instance' do
      Api::Client.configure do |config|
        config.url     = 'http://exec.apptamers.local'
        config.version = 'v1'
      end
    end
  end

  describe '.configuration' do
    before { Api::Client.configure { |config| config.url = 'http://exec.repofs.apptamers.local' } }
    it 'should return Api::Client::Configuration instance' do
      expect(Api::Client.configuration.url).to eql 'http://exec.repofs.apptamers.local'
    end
  end
end