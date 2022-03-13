Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "home/index"
  resources :customers, only: %i[index show]

  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
