Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :restaurants, only: [:new, :create, :show]
  resources :sales_reps, only: [:new, :create, :show]
end
