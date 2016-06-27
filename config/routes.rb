Rails.application.routes.draw do
#   root 'users#new'
#
#   get 'posts', to: 'posts#index'
#   get 'posts/new', to: 'posts#new', as: 'new_post'
#
#   resources :sessions, only: [:create]
#   get 'users/new', as: 'home'
#   get 'login', to: 'sessions#new', as: 'sign_in'
#   delete 'logout', to: 'sessions#destroy'
#
#   # resources :statics
#   resources :users do
#     resources :posts
#   end
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end


# get 'sign_up', to: 'users#new' as: :sign_up

  get 'sign_up', to: 'users#new', as: :sign_up

  resources :users, only: [:new, :create] do
    resources :posts
  end

  get 'sessions/new', as: :sign_in
  post 'sessions/create', as: :create_session
  post 'sessions/destroy', as: :sign_out

  get '/', to: 'posts#index', as: :home

end
