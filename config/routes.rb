Rails.application.routes.draw do
  
root "sessions#home"
  
get '/signup' => 'users#new'
post '/signup' => 'users#create'

#login route
get '/login' => 'sessions#new'               # displays login page 
post '/login' => 'sessions#create'           # processes login information

#logout route
delete '/logout' => 'sessions#destroy'       
  
  resources :users
  resources :comicbooks
  resources :reviews
  #resources :comicbooks do
  #resources :reviews, shallow: true
  end
end

# https://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html#method-i-resources
#Generates shallow routes for nested resource(s). 
#When placed on a parent resource, generates shallow routes for all nested resources
#It is same as 
#resources :comicbooks do
     #resources :reviews, only: [:new, :create, :index]
#end 
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

