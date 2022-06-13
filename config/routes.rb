Rails.application.routes.draw do

root "products#index"

resources :products
get '/register', to: 'users#new'
get '/users/sign_in', to: 'sessions#new', as: :sign_in
delete '/users/sign_out', to: 'sessions#destroy', as: :sign_out
resources :sessions, only: [:create]
resources :users


get '/confirm_cart', to: 'carts#show', as: :confirm_cart
get '/checkout', to: 'carts#index', as: :checkout
post '/carts', to: 'carts#add_to_cart', as: :add_to_cart
get '/carts/edit_cart', to: 'carts#edit', as: :edit_cart
patch '/carts/edit_cart', to: 'carts#update', as: :update_quantities
delete 'confirm_cart', to: 'carts#destroy', as: :remove_from_cart

resources :orders, only: [:create]

end
