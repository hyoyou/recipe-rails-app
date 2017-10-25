Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  devise_for :users

  root 'welcome#home'
end
