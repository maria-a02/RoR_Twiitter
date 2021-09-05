class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :followers, class_name: 'Follow', foreign_key: :following_id, dependent: :destroy
  has_many :followings, class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy

  def users_to_follow
    User.where.not(id: followers.map(&:follower_id)).limit(5)
  end
  
end
