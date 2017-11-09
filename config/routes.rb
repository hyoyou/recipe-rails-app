Rails.application.routes.draw do
  resources :ingredients

  #show recipes by key_ingredient
  resources :ingredients, only: [:show] do
    resources :recipes, only: [:index]
  end

  resources :recipes

  #delete ingredients from recipe (only deletes key_ingredient)
  resources :recipes, only: [:edit] do
    resources :ingredients, only: [:destroy]
  end

  resources :recipes, only: [:show] do
    resources :ratings, only: [:index, :new, :create]
  end

  resources :categories, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  root 'recipes#index'
end
