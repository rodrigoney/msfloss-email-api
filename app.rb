# app.rb
require "sinatra"
require "sinatra/base"
require 'sinatra/activerecord'
require "sinatra/namespace"

class Email < ActiveRecord::Base
	scope :sender, -> (sender) { where("sender = ?", sender) if sender.present? }
	scope :recipient, -> (recipient) { where("recipient = ?", recipient) if recipient.present? }
	scope :message_contains, -> (message) { where("message LIKE ?", "%" << message << "%") if message.present? }
	scope :subject, -> (subject) { where("subject = ?", subject) if subject.present? }
	scope :subject_contains, -> (subject) { where("subject LIKE ?", "%" << subject << "%") if subject.present? }
	scope :message_id, -> (message_id) { where("message_id = ?", message_id) if message_id.present? }
	scope :in_reply_to, -> (in_reply_to) { where("in_reply_to = ?", in_reply_to) if in_reply_to.present? }
	scope :action, -> (action) { where("action = ?", action) if action.present? }
	scope :subsystem, -> (subsystem) { where("subsystem = ?", subsystem) if subsystem.present? }
	scope :subject_original, -> (subject_original) { where("subject_original = ?", subject_original) if subject_original.present? }
	scope :subject_original_contains, -> (subject_original) { where("subject_original LIKE ?", "%" << subject_original << "%") if subject_original.present? }
	scope :start_date, -> (start_date) { where("date >= ?", start_date) if start_date.present? }
	scope :end_date, -> (end_date) { where("date <= ?", end_date) if end_date.present? }
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

		get '/emails/id/:email_id' do
			Email.find(params[:email_id]).to_json
		end

		get '/emails/query' do
		 	Email.sender(params[:sender])
		 		 .recipient(params[:recipient])
		 		 .message_contains(params[:message_contain])
		 		 .subject(params[:subject])
		 		 .subject_contains(params[:subject_contain])
		 		 .message_id(params[:message_id])
		 		 .in_reply_to(params[:in_reply_to])
		 		 .action(params[:action])
		 		 .subsystem(params[:subsystem])
		 		 .subject_original(params[:subject_original])
		 		 .subject_original_contains(params[:subject_original_contain])
		 		 .start_date(params[:start_date])
		 		 .end_date(params[:end_date])
		 		 .to_json
		end
	end
end
