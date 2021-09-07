class Api::V1::TweetController < ApplicationController

  #skip_before_action :verify_authenticity_token
    def tweets_last50
    @tweet = Tweet.last(50)
    api = []
    @tweet.each do |t|
      api << {  id: t.id, 
                content: t.content,
                user_id: t.user_id,
                like_count: t.likes.count,
                retweets_count: t.retweets.count,
                retwitted_from: t.tweet_id, 
              }
    end
    render json: api
  end

    def tweets_bydate
    @date1 = params[:date1]
    @date2 = params[:date2]
    dates = Tweet.where('DATE(created_at) >= ? AND DATE(created_at) <= ?', @date1, @date2)
    render json: dates
    end
  
end
