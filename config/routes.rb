Rails.application.routes.draw do
  resources :ingredients

  resources :recipes

  resources :recipes, only: [:edit] do
    resources :ingredients, only: [:destroy]
  end

  resources :categories, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  #get '/categories' => 'categories#index'

  root 'recipes#index'
end
