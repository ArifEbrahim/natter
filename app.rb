require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user.rb'

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
    @message = session[:message]    
    erb(:'messages/index')
  end

  get '/messages/new' do
    erb(:'messages/new')
  end

  post '/messages' do
    session[:message] = params[:message]
    redirect('/messages')
  end

  get '/users/new' do
    erb(:'users/new')
  end
  
  post '/users' do
    user = User.create(user_name: params[full_name], email: params[email], password: params[password])
    session[:user_id] = user.id
    redirect('/messages')
  end

end