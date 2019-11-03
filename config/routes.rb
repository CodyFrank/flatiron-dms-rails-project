Rails.application.routes.draw do
  root 'application#home'
  resources :customers, except: [:new] do
    resources :vehicles, only: [:new, :edit, :create, :update]
  end
  resources :employees do
    resources :repair_orders, only: [:show, :index]
  end
  resources :jobs, except: [:new, :edit, :index, :show]
  resources :repair_orders do
    resources :jobs, only: [:new, :edit]
  end
  resources :vehicles, except: [:show, :new]

  get '/signup' => 'customers#new', as: 'signup'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/login/employee' => 'sessions#new_employee', as: 'login_employee'
  post '/login/employee' => 'sessions#create_employee'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
