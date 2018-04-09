Rails.application.routes.draw do
  resources :posts
  #get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]

  #get 'users/new'
  resources :users, only: [:new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/top', to: 'top#index'
  root to: 'top#index'

  resources :favorites, only: [:create, :destroy]
end
