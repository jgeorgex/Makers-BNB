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
    @user = MbnbUser.create(email: params[:email],username: params[:username], firstname: params[:firstname], surname: params[:lastname], password: params[:password])
    redirect "/user/#{@user.id}"
  end

  get '/user/:id' do
    @user = MbnbUser.find(params[:id])
    erb :user_homepage
  end

  get '/user/:id/listings' do
    @user = MbnbUser.find(params[:id])
    @properties = Property.all(params[:id])
    erb :manage_listings
  end

  post '/user/:id/listings/new' do
    @property = Property.create(user_id: params[:id] , address: params[:address], capacity: params[:capacity], description: params[:description], pricepn: params[:pricepn])
    redirect "/user/#{params[:id]}/listings"
  end

  run! if __FILE__ == $PROGRAM_NAME
end
