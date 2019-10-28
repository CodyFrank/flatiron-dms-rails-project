Rails.application.routes.draw do
  root 'application#home'
  resources :customers, except: [:new]
  resources :employees do
    resources :repair_orders, only: [:show, :index]
  end
  resources :jobs, except: [:new, :edit]
  resources :repair_orders do
    resources :jobs, only: [:new, :edit]
  end
  resources :vehicles, except: [:show, :edit, :update]

  get '/signup' => 'customers#new', as: 'signup'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth', as: 'google_login'
  get 'auth/failure', to: redirect('/')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
