require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user.rb'
require './lib/message.rb'

class Natter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/messages' do
    @user = User.find(session[:user_id])
    @messages = Message.all    
    erb(:'messages/index')
  end

  get '/messages/new' do
    erb(:'messages/new')
  end

  post '/messages' do
    text = params[:text]
    Message.create("#{text}")
    redirect('/messages')
  end

  get '/users/new' do
    erb(:'users/new')
  end
  
  post '/users' do
    user = User.create(full_name: params[:full_name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/messages')
  end

end