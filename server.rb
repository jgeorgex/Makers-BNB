require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'

class MakersBNB < Sinatra::Base

  get '/' do
    erb :sign_up
  end

  post '/user/new' do
    $firstname = params[:firstname]
    redirect '/user'
  end

  get '/user' do
    erb :user_homepage
  end

  get '/user/listings' do
    erb :manage_listings
  end

  post '/user/listings/new' do
    #new listing = Listing.new(params...)
    redirect '/user/listings'
  end

  run! if __FILE__ == $PROGRAM_NAME
end
