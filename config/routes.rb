Rails.application.routes.draw do

  get 'ord_prof', to: "order_prof#index"
  get 'ord_prof_show', to: "order_prof#show"
  get 'ord_prof_edit', to: "order_prof#edit"

  get "order_list", to: "order_list#index"
  get "order_list", to: "order_list#show"

  get "freela_list", to: "freela_list#index"
  get "freela_list", to: "freela_list#show"

  post "profile_edit", to: "profile#index"
  put "profile_change", to: "profile#edit"
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
