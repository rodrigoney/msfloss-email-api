require 'rack/test'
require 'rspec'
require_relative '../app.rb'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class 
  end
end

RSpec.configure do |c| 
  c.include RSpecMixin 
end