Rails.application.routes.draw do
  root 'application#home'
  resources :customers
  resources :employees, except: [:new] do
    resources :repair_orders, only: [:show, :index]
  end
  resources :jobs
  resources :repair_orders
  resources :vehicles

  get '/signup' => 'employees#new', as: 'signup'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  # get 'employees/:id/repair_orders', to: 'employees#repair_orders_index'
  # get 'employee/:id/repair_orders/:repair_order_id', to: 'employee#repair_order'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
