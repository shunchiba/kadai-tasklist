Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :tasks,only:[:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create]
end
