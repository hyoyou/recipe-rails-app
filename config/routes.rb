Rails.application.routes.draw do
  resources :ingredients
  resources :recipes

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  root 'welcome#home'
end
