Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "sessions#new"
  
  resource :session
  resources :users
  resources :books
  resources :reviews
end
