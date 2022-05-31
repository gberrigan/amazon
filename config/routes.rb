Rails.application.routes.draw do

get '/register', to: 'users#new'
resources :users, only: [:create, :index, :new]
get '/users/sign_in', to: 'sessions#new', as: :sign_in
delete '/users/sign_out', to: 'sessions#destroy', as: :sign_out
resources :sessions, only: [:create]


  
end
