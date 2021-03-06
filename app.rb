# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'
# require_relative './app/controllers/role_controller'


get "/" do
  erb :welcome
end

get '/roles' do
  erb :"/roles/index.html"
end


class ApplicationController < ActiveRecord::Base

end

#get "/contacts" do
#  @contacts = Contact.all
#  erb :index
#end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
