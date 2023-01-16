Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'dashboard#index'

  resources :credentials, only: :create
  resources :assets, only: %i[index show create], path: 'wallet_assets', as: 'wallet_assets'
  resources :transfer_assets, only: %i[new create]
end
