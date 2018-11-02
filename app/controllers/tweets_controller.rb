class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :'tweets/tweets'
    else redirect '/login'
    end
  end

  post '/tweets' do
    @tweet = Tweet.create(content: params[:content])
    redirect "/tweet/#{@tweet.id}"
  end



  get '/tweets/new' do
    erb :'tweets/new'
  end



end
