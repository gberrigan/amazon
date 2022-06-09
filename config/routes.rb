Rails.application.routes.draw do

root "products#index"

resources :products
get '/register', to: 'users#new'
get '/users/sign_in', to: 'sessions#new', as: :sign_in
delete '/users/sign_out', to: 'sessions#destroy', as: :sign_out
resources :sessions, only: [:create]
resources :users

get '/checkout', to: 'carts#index', as: :checkout

post '/carts', to: 'carts#add_to_cart', as: :add_to_cart
put '/carts', to: 'carts#update_quantities', as: :update_quantities
get '/carts', to: 'carts#index', as: :view_cart

resources :orders, only: [:create]

end
