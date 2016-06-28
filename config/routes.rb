Rails.application.routes.draw do

  root 'posts#index', as: :home

  get 'sign_up', to: 'users#new', as: :sign_up
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

#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end


# get 'sign_up', to: 'users#new' as: :sign_up
  #
  # get 'sign_up', to: 'users#new', as: :sign_up
  #
  # resources :users, only: [:new, :create] do
  #   resources :posts
  # end
  #
  # get 'sessions/new', as: :sign_in
  # post 'sessions/create', as: :create_session

  #
  # get '/', to: 'posts#index', as: :home

end
