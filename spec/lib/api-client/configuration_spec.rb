require_relative '../../../spec/spec_helper.rb'

describe Api::Client::Configuration do
  it 'should initialize new instance' do
    expect(Api::Client::Configuration.new.url).to be_nil
  end
end