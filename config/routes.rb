Rails.application.routes.draw do
  root 'homes#index'

  resources :courses do
    resources :lessons, only: [:new, :create]
    resources :saves, only: :create
    resources :searches, only: [:index, :create]
  end

  resources :categories, only: :show
  resources :lessons, only: [:edit, :update, :destroy]

  devise_for :users
  resources :users, only: :show
end
