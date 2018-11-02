class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/tweets'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(username: params["username"], email: params["email"], password: params["password"])
    if @user.save && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/tweets'
    else redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/tweets'
    else erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/tweets'
    else redirect '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(slug)
    erb :'users/show'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
