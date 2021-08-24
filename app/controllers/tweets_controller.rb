class TweetsController < ApplicationController
  def index
    @tweets = Tweet.limit(50)
    @tweet = Tweet.new
    @user_likes = Like.where(user: current_user).pluck(:tweet_id)
  end

  def create
    @tweets = Tweet.limit(50)
    @tweet = Tweet.new(content:params[:tweet][:content])
    @tweet.user = current_user
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Your tweet has been posted successfully." }
      else
        format.html { render :index }
      end
    end
  end

  def retweet
    @tweet = Tweet.find(params[:id])
    new_tweet = Tweet.create(content: @tweet.content, user: current_user)
    @tweet.retweets << new_tweet
    redirect_to root_path
  end

end
