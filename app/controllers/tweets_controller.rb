class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :'tweets/tweets'
    else redirect '/login'
    end
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    @user = current_user
    @tweet = Tweet.create(content: params[:content], user_id: params[:user_id])
    @tweet.user_id = @user.id
    @tweet.save
    redirect "/tweet/#{@tweet.id}"
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    erb :'tweets/show_tweets'
  end




end
