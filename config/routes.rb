Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'tweets#index'
  post 'tweets/create', as: 'tweets'
  post 'tweets/retweet/:id', to: 'tweets#retweet', as: 'retweet'
  get 'likes/:id', to: 'likes#like', as: 'like'
  delete 'likes/:id', to: 'likes#dislike', as: 'dislike'
  get 'tweets/likes/:id', to: 'tweets#show', as: 'tweet_detail'
  post 'follows/:id', to: 'follows#to_follow', as: 'follow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

