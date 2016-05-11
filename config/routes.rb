Rails.application.routes.draw do
  resources :fun_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books

  match ':controller(/:action(/:id))', via: [ :get, :post, :patch ]
end
