class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signups"
  end

end
