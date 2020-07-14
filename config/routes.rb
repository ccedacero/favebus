Rails.application.routes.draw do
  get 'stations/new'
  get 'stations/create'
  # root 'home/index'
  get 'home/index'
  # resources :riders, only: [:new, :create, :show, :edit, :delete]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout' , to: 'sessions#logout'
  get 'station_information', to: 'route_data#station_information'
  resources :riders 
  resources :route_data
  resources :rider_routes
  resources :bus_routes
  resources :stations 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
