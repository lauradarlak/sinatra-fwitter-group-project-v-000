class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/tweets'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    
  end

end
