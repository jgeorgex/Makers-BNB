require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'

class MakersBNB < Sinatra::Base

  get '/' do
    erb :sign_up
  end
  run! if __FILE__ == $PROGRAM_NAME
end
