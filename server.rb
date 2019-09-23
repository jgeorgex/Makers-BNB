require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'

class MakersBNB < Sinatra::Base

  get '/' do
    erb :sign_up
  end

  post '/user/new' do
    p params.inspect
    $firstname = params[:firstname]
    redirect '/user'
  end

  get '/user' do
    erb :user_homepage
  end

  run! if __FILE__ == $PROGRAM_NAME
end
