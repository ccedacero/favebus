Rails.application.routes.draw do
  get "stations/new"
  get "stations/create"
  get "home/index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "welcome", to: "sessions#welcome"
  get "authorized", to: "sessions#page_requires_login"
  get "logout", to: "sessions#logout"
  get "station_information", to: "route_data#station_information"
  resources :riders
  resources :route_data
  resources :rider_routes
  resources :bus_routes
  resources :stations
end
