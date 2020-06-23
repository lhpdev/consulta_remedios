Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/',  to: 'customers#index', as: 'home'

  post '/customers/create', to: 'customers#create'
  post '/customers/select', to: 'customers#select'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  post '/cart_items/add', to: 'cart_items#add'
  post '/cart_items/remove', to: 'cart_items#remove'

  post 'carts/complete', to: 'carts#complete'
  post 'carts/cancel', to: 'carts#cancel'
end
