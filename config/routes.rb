Rails.application.routes.draw do
  resources :ingredients

  resources :recipes

  resources :recipes, only: [:edit] do
    resources :ingredients, only: [:destroy]
  end

  resources :recipes, only: [:show] do
    resources :ratings, only: [:index, :new]
  end

  resources :categories, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  root 'recipes#index'
end
