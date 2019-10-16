Rails.application.routes.draw do
  root 'application#home'
  resources :customers
  resources :employees, except: [:new]
  resources :jobs
  resources :repair_orders
  resources :vehicles

  get '/signup' => 'employees#new', as: 'signup'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
