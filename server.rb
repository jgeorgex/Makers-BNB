require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'
require_relative './lib/mbnb_user'
require_relative './lib/property'

class MakersBNB < Sinatra::Base

  get '/' do
    erb :sign_up
  end

  post '/user/new' do
    p MbnbUser.create(email: params[:email],username: params[:username], firstname: params[:firstname], surname: params[:lastname], password: params[:password])
    redirect '/user'
  end

  get '/user' do
    erb :user_homepage
  end

  get '/user/listings' do
    erb :manage_listings
  end

  post '/user/listings/new' do
    $listing = {name: params[:name], address: params[:address], capacity: params[:capacity]};
    #new listing = Listing.new(params...)
    redirect '/user/listings'
  end

  run! if __FILE__ == $PROGRAM_NAME
end
