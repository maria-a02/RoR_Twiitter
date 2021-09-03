class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id", dependent: :destroy
    belongs_to :original_tweet, class_name: "Tweet", foreign_key: "tweet_id", optional: true
    validates :content, presence: true

    scope :tweets_for_me, -> (user) { where(:user_id => user.followers.pluck(:follower_id))}
end
