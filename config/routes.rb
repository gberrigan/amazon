Rails.application.routes.draw do

root "products#index"

resources :products
get '/register', to: 'users#new'
get '/users/sign_in', to: 'sessions#new', as: :sign_in
delete '/users/sign_out', to: 'sessions#destroy', as: :sign_out
resources :sessions, only: [:create]
resources :users

  
end
