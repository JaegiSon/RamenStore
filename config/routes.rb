Rails.application.routes.draw do
  
  
  devise_for :admins 
    
  devise_scope :admin do  
    get '/admins/sign_out' => 'devise/sessions#destroy'     
 end
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
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end

  
  get '/checkout' => 'cart#createOrder'

  root 'static_pages#home'
  
  get '/home' => 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/category' => 'static_pages#categories'
 
  get '/login' => 'user#login' 
  get '/logout' => 'user#logout'
  
  get 'category/:title' => 'static_pages#category'
  resources :items
  
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clear'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/reduce/:id' => 'cart#reduce'
  get '/cart/increase/:id' => 'cart#increase'
  
  
  get '/search' => 'items#search'
  
end
