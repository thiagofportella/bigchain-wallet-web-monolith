Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'dashboard#index'

  resources :credentials, only: :create
  resources :assets, only: :create, path: 'wallet_assets', as: 'wallet_assets'
end
