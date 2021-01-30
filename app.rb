# models.rb

require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'


get "/" do
  erb :home
end
# Class
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

  end

  get "/" do

    erb :home
  end


end

# class Contact < ActiveRecord::Base
#   self.table_name = 'salesforce.contact'
# end

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
