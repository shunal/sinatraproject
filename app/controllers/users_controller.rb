class UsersController < ApplicationController
  configure do 
    enable :sessions
    set :session_secret, "secret"
  end 

  get "/users" do
    erb :"/users/index.html"
  end

  get "/users/new" do
    @instruments = Instrument.all
    erb :"/users/new.html"
  end

  post "/logout" do 
    session.clear
    redirect "/"
  end 


  post "/users" do
    
    if !params["user"]["username"] || !params["user"]["password"].empty?
    @user = User.create(params["user"])
    else redirect "/"
    end 
      if !params["instrument"]["type"].empty?
       @instrument = Instrument.create(instrument_type: params["instrument"]["type"], user_id: @user.id)
        @user.instruments << @instrument
      end
    session[:user_id] = @user.id
    
    redirect "/users/#{@user.id}"
  end

  post "/new_instrument" do 
    @user = User.find(session[:user_id])
      if !params["instrument"]["type"].empty?
        @instrument = Instrument.create(instrument_type: params["instrument"]["type"], user_id: @user.id)
        @user.instruments << @instrument
        redirect "/users/#{@user.id}"
      else
        @error = 'test'
        erb :'users/show.html'
      end
    
    
  end


  post "/login" do 
    @user = User.find_by(username: params["username"])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end 

  get "/users/:id" do
    @user = User.find(session[:user_id])
    erb :"/users/show.html"
  end

  post "/users/:id" do
    @user = User.find_by(id: params["id"])
    redirect "/users/#{@user.id}"
  end 


  get "/users/:id/edit" do
    @user = User.find(session[:user_id])
    @instruments = Instrument.all
    erb :"/users/edit.html"
  end

  
  patch "/users/:id" do
    redirect "/users/:id"
  end


  delete "/users/:id/delete" do
    redirect "/users"
  end

end
