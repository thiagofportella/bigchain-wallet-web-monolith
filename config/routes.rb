Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'dashboard#index'

  resources :credentials, only: :create
end
