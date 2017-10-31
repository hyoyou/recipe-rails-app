Rails.application.routes.draw do
  resources :ingredients
  resources :recipes

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  get '/categories' => 'categories#index'

  root 'welcome#home'
end
