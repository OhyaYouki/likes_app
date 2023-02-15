Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts,only: [:index,:create,:show]  do
    resources :likes, only: [:create,:destroy]
  end

  resources :users,only: :show do
    # resources :likes, only: [:destroy]
    delete 'likes/:id', to: 'likes#user_show_destroy'
  end
end


