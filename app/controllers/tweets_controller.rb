class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :'tweets/tweets'
    else redirect '/signup'
    end
  end

  post '/tweets' do

  end

  get '/tweets/new' do

  end

end
