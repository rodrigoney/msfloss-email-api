require_relative 'spec_helper.rb'
require_relative '../app.rb'
require 'json'

RSpec.describe EmailApi do

  it 'should allow accessing the main' do
    get '/'
    expect(last_response).to be_ok
  end

  it "should return positive emails count" do
    get 'api/v1/emails/count'
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)['count']).to be >= 0
  end

end