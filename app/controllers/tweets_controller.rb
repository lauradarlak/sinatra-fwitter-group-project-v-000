class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :'tweets/tweets'
    else redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
  end

  post '/tweets' do
    if logged_in? && params[:content] != ""
      user = current_user
      @tweet = Tweet.create(content: params[:content])
      @tweet.user_id = current_user.id
      @tweet.save
      redirect "tweets/#{@tweet.id}"
    else redirect '/tweets/new'
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'tweets/show_tweets'
    else redirect '/login'
    end
  end




end
