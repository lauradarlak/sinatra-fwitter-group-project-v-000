class UsersController < ApplicationController

  get '/signup' do
    if session[:user_id] == nil
      erb :'users/create_user'
    else redirect '/tweets'
  end

  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    if @user.save && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/tweets'
    else redirect '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user != nil && @user.password == params["password"]
      session[:user_id] = @user.id
      redirect '/tweets'
    else redirect '/signup'
    end
  end

end
