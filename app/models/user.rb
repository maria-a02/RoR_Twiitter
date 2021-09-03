class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :likes
  has_many :followers, class_name: 'Follow', foreign_key: :following_id, dependent: :destroy
  has_many :followings, class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy

  def users_to_follow
    User.where.not(id: followers.map(&:follower_id)).limit(5)
  end
  
end
