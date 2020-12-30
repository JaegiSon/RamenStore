Rails.application.routes.draw do
  
  
  resources :categories
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  resources :orders do
    resources:orderitems
  end
  devise_for :views
  devise_for :users do
    resources :orders 
  end

  get '/checkout' => 'cart#createOrder'

  root 'static_pages#home'
  
  get '/home' => 'static_pages#home'
  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  
 
  get '/login' => 'user#login' 
  get '/logout' => 'user#logout'
  
  get 'category/:title', to: 'static_pages#category'
  resources :items
  
  
  get '/cart' => 'cart#index'

  get '/cart/clear' => 'cart#clear'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/reduce/:id' => 'cart#reduce'
  get '/cart/increase/:id' => 'cart#increase'
  
  post '/search' => 'items#search'
end
