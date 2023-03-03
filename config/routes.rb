Rails.application.routes.draw do

  get 'adreview/index'
  post 'add_review', to: "adreview#show"
  post 'adreview/edit'

  get 'ord_prof', to: "order_prof#index"
  post 'ord_prof_take_fr', to: "order_prof#take_freelance"
  post 'ord_prof_show', to: "order_prof#show"
  post 'ord_prof_freel', to: "order_prof#prefree"
  put 'ord_prof_edit', to: "order_prof#edit"
  post 'order_sub', to: "order_prof#submitting"
  delete 'ord_prof_delete', to: "order_prof#delete"
  put 'archivate', to: "order_prof#archivate"

  get "order_list", to: "order_list#index"
  get "order_list", to: "order_list#show"

  get "freela_list", to: "freela_list#index"
  get "freela_list", to: "freela_list#show"

  post "profile_edit", to: "profile#index"
  put "profile_change", to: "profile#edit"
  put "profile", to: "profile#show"
  get "profile", to: "profile#show"
  post "new_order", to: "profile#input_data"
  put "save_order", to: "profile#add_order"

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
