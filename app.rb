require 'sinatra/base'
require 'sinatra/reloader'

class Natter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

end