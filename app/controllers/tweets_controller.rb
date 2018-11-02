class TweetsController < ApplicationController

  get '/tweets' do
    @user = User.find(session[:id])
    erb :'tweets/tweets'
  end

  post '/tweets' do

  end

  get '/tweets/new' do

  end

end
