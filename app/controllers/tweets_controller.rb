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
    else redirect '/login'
    end
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

  post '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.delete
    redirect '/tweets'
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/edit_tweets'
    else redirect '/login'
    end
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.update(params[:tweet])
    redirect "tweet/#{tweet.id}"
  end

end
