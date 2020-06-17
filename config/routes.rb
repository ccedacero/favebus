Rails.application.routes.draw do
  resources :riders, only: [:new, :create, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :route_data
  resources :rider_routes
  resources :bus_routes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
