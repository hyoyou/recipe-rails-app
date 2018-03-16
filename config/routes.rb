Rails.application.routes.draw do

  resources :ingredients

  #show recipes by key_ingredient
  resources :ingredients, only: [:show] do
    resources :recipes, only: [:index]
  end

  resources :recipes

  get '/recipes/:id/next', to: 'recipes#next'

  #delete ingredients from recipe (only deletes key_ingredient)
  resources :recipes, only: [:edit] do
    resources :ingredients, only: [:destroy]
  end

  resources :recipes, only: [:show] do
    resources :ratings, only: [:index, :new, :create]
  end

  resources :recipes, only: [:show] do
    resources :comments, only: [:index, :new, :create]
  end

  resources :categories

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  root 'recipes#home'

end
