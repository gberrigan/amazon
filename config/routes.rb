Rails.application.routes.draw do

root "products#index"

resources :products
get '/register', to: 'users#new'
get '/users/sign_in', to: 'sessions#new', as: :sign_in
delete '/users/sign_out', to: 'sessions#destroy', as: :sign_out
resources :sessions, only: [:create]
resources :users

post '/cart', to: 'cart#add_to_cart', as: :add_to_cart
put '/cart', to: 'cart#update_quantities', as: :update_quantities
get '/cart', to: 'cart#index', as: :view_cart

end
