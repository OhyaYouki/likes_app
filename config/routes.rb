Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts,only: [:index,:create,:show]  do
    resources :likes, only: [:create,:destroy]
  end

  resources :users,only: :show
end
