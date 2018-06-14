Rails.application.routes.draw do
  resources :order_items
 
  resources :orders do
    member do
      post 'charge'
    end
  end

  resources :carts do
    member do
      post 'add_to_order'
    end
  end
  resources :products do 
    member do 
      post 'add_to_cart'
    end
  end
  # root 'products#index'
  root 'pages#home'
  # root 'profiles#index'
  resources :addresses
  resources :profiles
  devise_for :users

  # add_product_to_cart
  # post '/add_product_to_cart', to: 'products#add_product_to_cart`, as: 'add_product_to_cart`

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
