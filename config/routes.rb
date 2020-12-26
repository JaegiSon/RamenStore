Rails.application.routes.draw do
  
  
  devise_for :views
  devise_for :users
  root 'static_pages#home'
  
  get '/home' => 'static_pages#home'
  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  
 
  get '/login' => 'user#login' 
  get '/logout' => 'user#logout'
  
  
  resources :items
  
  
  get '/cart' => 'cart#index'

  get '/cart/clear' => 'cart#clear'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/reduce/:id' => 'cart#reduce'
  get '/cart/increase/:id' => 'cart#increase'
  
  
end
