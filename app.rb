# app.rb
require "sinatra"
require "sinatra/base"
require 'sinatra/activerecord'
require "sinatra/namespace"

class Email < ActiveRecord::Base
end

class EmailApi < Sinatra::Base
	register Sinatra::Namespace

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
end
