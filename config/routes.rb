Rails.application.routes.draw do

  root 'posts#index', as: :home

  get 'sign_up', to: 'users#new'
  # get '', to: 'posts#index', as: 'home'

  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new', as: 'new_post'

  resources :sessions, only: [:create]
    delete 'sign_out', to: 'sessions#destroy'
    get 'sign_in', to: 'sessions#new'
  # get 'users/new', as: 'home'


  # post 'sessions/destroy', as: :sign_out

  # resources :statics
  resources :users do
   resources :posts
  end

end
