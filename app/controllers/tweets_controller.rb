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

  # post '/tweets' do
  #   if logged_in? && params[:content].present?
  #     user = current_user
  #     tweet = Tweet.create(content: params[:content], user_id: params[:user_id])
  #     tweet.user_id = user.id
  #     tweet.save
  #     redirect "/tweet/#{tweet.id}"
  #   else redirect '/tweets/new'
  #   end
  # end
  post '/tweets' do

    if logged_in? && (params[:content] != "")
      user = User.find_by(session[:user_id])
      tweet = Tweet.new(content: params[:content])
      tweet.user_id = user.id
      tweet.save

      redirect to "/tweets/#{tweet.id}"
    else
      redirect to '/tweets/new'
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
