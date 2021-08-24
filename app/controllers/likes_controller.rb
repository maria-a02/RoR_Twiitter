class LikesController < ApplicationController
  before_action :authenticate_user!
  def like
    tweet = Tweet.find(params[:id])
    new_like = Like.create!(tweet: tweet, user: current_user)
    redirect_to root_path
  end

  def dislike
    tweet = Tweet.find(params[:id])
    like = tweet.likes.find_by(user: current_user)
    like.destroy
    redirect_to root_path
  end
end
