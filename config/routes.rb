Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts,only: [:index,:create,:show]  do
    resources :likes, only: [:create,:destroy]

    # 以下はダメ。上とかぶる
    # post 'likes', to: 'likes#user_show_create'
    # delete 'likes/:id', to: 'likes#user_show_destroy'
  end

  resources :users,only: :show do
    # resources :likes, only: [:destroy]
    post 'likes/:id', to: 'likes#user_show_create'
    delete 'likes/:id', to: 'likes#user_show_destroy'
  end
end


