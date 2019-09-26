require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'
require_relative './lib/mbnb_user'
require_relative './lib/property'
require './lib/database_connection_setup'
require './lib/reservation'

class MakersBNB < Sinatra::Base

  get '/' do
    john = erb :sign_up
  end

  get '/reservations_api/:p_id' do
    r = Reservation.all(property_id: params[:p_id])
    y = []
    r.each { |date| y.push(date.gsub('-', ', '))}
    p y
    json(y)
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
    @properties = Property.user_all(params[:id])
    erb :manage_listings
  end

  post '/user/:id/listings/new' do
    @property = Property.create(user_id: params[:id], name: params[:name], address: params[:address], capacity: params[:capacity], description: params[:description], pricepn: params[:pricepn])
    redirect "/user/#{params[:id]}/listings"
  end

  get '/user/:id/browse' do
    @id = params[:id]
    @properties = Property.all
    erb :browse_properties
  end

  get '/user/:id/booking/:p_id' do
    @p_id = params[:p_id]
    @user_id = params[:id]
    erb :book_property
  end

  run! if __FILE__ == $PROGRAM_NAME
end
