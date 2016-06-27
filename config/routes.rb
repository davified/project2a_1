Rails.application.routes.draw do
  root 'users#new'

  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new', as: 'new_post'

  resources :sessions, only: [:create]
  get 'users/new', as: 'home'
  get 'login', to: 'sessions#new', as: 'sign_in'
  delete 'logout', to: 'sessions#destroy'

  # resources :statics
  resources :users do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
