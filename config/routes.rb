Rails.application.routes.draw do
  root 'homes#index'

  resources :courses do
    resources :lessons, only: [:new, :create, :show]
    resources :saves, only: :create
    resources :searches, only: [:index, :create]
  end

  resources :categories, only: :show
  resources :lessons, only: [:edit, :update, :destroy]
  resources :things, only: :index
  resources :lexicon, only: :show

  devise_for :users
  resources :users, only: :show
end
