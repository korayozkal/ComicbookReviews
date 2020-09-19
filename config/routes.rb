Rails.application.routes.draw do
  
root "sessions#home"
  
get '/signup' => 'users#new'
post '/signup' => 'users#create'

#login route
get '/login' => 'sessions#new'               # displays login page 
post '/login' => 'sessions#create'           # processes login information

#logout route
delete '/logout' => 'sessions#destroy'       
  
  resources :reviews
  resources :users
  resources :comicbooks


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
