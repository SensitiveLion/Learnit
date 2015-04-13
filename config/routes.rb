Rails.application.routes.draw do
  root 'homes#index'

  resources :courses do
    resources :lessons, only: [:index, :new, :create]
  end

  resources :lessons, only: [:edit, :update, :destroy]

  devise_for :users
end
