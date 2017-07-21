Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create, :show]

  resources :restaurants, only: [:new, :create, :show]
  resources :sales_reps, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
