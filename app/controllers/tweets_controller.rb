class TweetsController < ApplicationController
  def index
    if params[:q]
      @tweets = Tweet.where('content LIKE ?', "%#{params[:q]}%").order(created_at: :desc).page params[:page]
    else
      @tweets = Tweet.eager_load(:user, :likes).order(created_at: :desc).page params[:page]
    end
    @tweet = Tweet.new
    @user_likes = Like.eager_load(:user, :tweet).where(user: current_user).pluck(:tweet_id)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_likes = @tweet.likes
  end

  def create
    @tweets = Tweet.eager_load(:user, :likes).order(created_at: :desc).page params[:page]
    @tweet = Tweet.new(content: params[:tweet][:content])
    @tweet.user = current_user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Your tweet has been posted :)" }
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
