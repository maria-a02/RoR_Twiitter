Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  post 'tweets/create', as: 'tweets'
  post 'tweets/retweet/:id', to: 'tweets#retweet', as: 'retweet'
  post 'tweets/:id/likes', to: 'likes#like', as: 'like'
  delete 'likes/:id', to: 'likes#dislike', as: 'dislike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
