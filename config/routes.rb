Rails.application.routes.draw do
  root 'homes#index'

  resources :courses do
    resources :lessons, only: [:show, :new, :create]
    resources :saves, only: :create
  end


  resources :lessons, only: [:edit, :update, :destroy]

  devise_for :users
end
