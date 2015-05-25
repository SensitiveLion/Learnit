Rails.application.routes.draw do
  root 'homes#index'

  resources :courses do
    resources :lessons, only: [:new, :create, :show]
    resources :saves, only: :create
    resources :searches, only: :index
  end

  resources :lexicons, only: :show do
    resources :lexicon_searches, only: :index
  end

  resources :categories, only: :show
  resources :lessons, only: [:edit, :update, :destroy]
  resources :things, only: :index

  devise_for :users
  resources :users, only: :show
end
