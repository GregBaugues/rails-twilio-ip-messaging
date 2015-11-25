Rails.application.routes.draw do

  #create users
  resources :users, only: [:new, :create]

  #show account
  resource :account, only: [:show]

  #sign in, sign out
  resources :sessions, only: [:new, :create]
  get "sessions/destroy", to: 'sessions#destroy', as: 'sign_out'
  root 'accounts#show'
end


