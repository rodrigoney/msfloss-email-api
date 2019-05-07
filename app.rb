# app.rb
require "sinatra"
require 'sinatra/activerecord'
require "sinatra/namespace"

class Email < ActiveRecord::Base
end

get "/" do
	erb :index
end


namespace '/api/v1' do
	before do
		content_type 'application/json'
	end

	get "/" do
		erb :index
	end

	get '/emails' do
		Email.all.order(date: :desc).to_json
	end

	get '/emails/count' do
		{:count => Email.all.size}.to_json
	end

	get '/emails/:id' do
		Email.find(params[:id]).to_json
	end
end
