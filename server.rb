require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'json'
require 'mail'
require_relative './lib/mbnb_user'
require_relative './lib/property'
require_relative './lib/send_mail'
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
    json(y)
  end

  get '/login' do
    erb :login
  end

  post '/authenticate' do
 if MbnbUser.authenticate(params[:email], params[:password])
   @user = MbnbUser.find_by_email(params[:email])
    redirect "/user/#{@user.id}"
  else
    redirect "/"
  end
  end

  post '/user/new' do
    @user = MbnbUser.create(email: params[:email],username: params[:username], firstname: params[:firstname], surname: params[:lastname], password: params[:password])
    SendMail.sign_up_mail(params[:email])
    redirect "/user/#{@user.id}"
  end

  get '/user/:id' do
    @user = MbnbUser.find(params[:id])
    erb :user_homepage
  end

  get '/user/:id/listings' do
    @user = MbnbUser.find(params[:id])
    @properties = Property.user_all(params[:id])
    @reservations = []
    @properties.each { |p| res = Reservation.requests(property_id: p.id)
      @reservations << res}
    erb :manage_listings
  end

  post '/user/:id/listings/new' do
    @property = Property.create(user_id: params[:id], name: params[:name], address: params[:address], capacity: params[:capacity], description: params[:description], pricepn: params[:pricepn])
    creator_email = MbnbUser.find(params[:id]).email
    SendMail.created_space(creator_email)
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

  post '/user/:id/request/:p_id' do
    @date = "#{params[:year]}-#{params[:month]}-#{params[:day]}"
    Reservation.create(property_id: params[:p_id], user_id: params[:id], res_date: @date)
    prop = Property.find(params[:p_id])
    userid = prop.user_id
    email = MbnbUser.find(userid).email
    SendMail.mail_request(email)
    redirect '/confirmation'
  end

  get '/confirmation' do
    "your booking request has been sent"
  end

  post '/user/:u_id/res/:r_id/deny' do
    Reservation.deny(params[:r_id])
    recepient =Reservation.find_guest(params[:r_id])
    SendMail.mail_deny(recepient.guest.email)
    redirect "/user/#{params[:u_id]}/listings"
  end

  post '/user/:u_id/res/:r_id/confirm' do
    Reservation.confirm(params[:r_id])
    recepient =Reservation.find_guest(params[:r_id])
    SendMail.mail_confirm(recepient.guest.email)
    redirect "/user/#{params[:u_id]}/listings"
  end

  run! if __FILE__ == $PROGRAM_NAME
end
