Rails.application.routes.draw do
  devise_for :users

  root 'dashboard#index'

  resources :credentials, only: :create
end
