class UsersController < ApplicationController

  get '/signup' do
    puts params
    erb :'users/create_user'
  end

  post '/users' do
    
  end

end
