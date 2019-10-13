Rails.application.routes.draw do
  resources :employees
  resources :jobs
  resources :repair_orders
  resources :vehicles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
