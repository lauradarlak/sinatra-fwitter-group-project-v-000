class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  post '/users' do
    puts params
  end

end
