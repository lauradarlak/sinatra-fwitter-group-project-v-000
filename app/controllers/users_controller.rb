class UsersController < ApplicationController

  get '/signup' do
    puts params
    erb :'users/create_user'
  end

end
