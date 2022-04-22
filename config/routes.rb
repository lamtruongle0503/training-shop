Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/show", to: "users#show"
  get "/signup", to: "users#new"
  
  resources :products
  resources :users
  resources :admins
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  namespace :admin do
    resources :categories
    resources :products
    resources :charts
  end
end
