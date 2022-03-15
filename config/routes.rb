Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define applicaiton routers.
  get "/", to: "customers#index"
  get "/customers/missing_email", to: "customers#missing_email"
  get "/customers/alphabetized", to: "customers#index_1"
  resources :customers, only: %i[index show]

  root to: "customers#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
