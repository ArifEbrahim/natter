require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/user.rb'
require './lib/message.rb'
require './database_connection_setup.rb'

class Natter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/messages')
  end

  get '/messages' do
    @user = User.find(session[:user_id])
    @messages = Message.all    
    erb(:'messages/index')
  end

  get '/messages/new' do
    unless session[:user_id]
      flash[:notice] = 'Please sign up to post a peep'
      redirect('/messages')
    else
      erb(:'messages/new')
    end
  end

  post '/messages' do
    time_stamp = Time.now.strftime("%k:%M %d/%m/%Y")
    user = User.find(session[:user_id])
    Message.create(text: "#{params['text']}", time_stamp: time_stamp, full_name: user.full_name)
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

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/messages')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/messages')
  end

end