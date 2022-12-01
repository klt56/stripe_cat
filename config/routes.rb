Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :customer_portal_sessions, only: [:create] 
  # Defines the root path route ("/")
  root "homes#index"
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    
    resources :products
    post "checkout/create", to: "checkout#create"
    resources :webhooks, only: [:create]
    get "success", to: "checkout#success"
    get "cancel", to: "checkout#cancel"

    
    post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
    delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  end
end
