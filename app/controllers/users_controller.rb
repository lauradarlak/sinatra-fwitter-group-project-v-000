class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  post '/users' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id

  end

end
