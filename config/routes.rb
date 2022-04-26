Rails.application.routes.draw do
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
  resources :orders
  namespace :admin do
    resources :categories
    resources :products
    resources :users
    resources :payment_methods
    resources :chart_analyses

  end

  resources :account_activations, only: %i(edit)
  resources :password_resets, only: %i(new create edit update)
  resources :carts, only: %i(index) do
    collection do
      post "add_to_cart/:id", to: "carts#add_to_cart", as: "add_to"
      delete "remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from"
    end
  end
end
