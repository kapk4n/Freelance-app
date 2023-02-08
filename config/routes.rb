Rails.application.routes.draw do

  get 'profile/index'
  get "profile", to: "profile#show"

  root "main#index"
  get 'main/show'


  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
