Rails.application.routes.draw do
  
root "sessions#home"
  
get '/signup' => 'users#new'
post '/signup' => 'users#create'

#my login route
get '/login' => 'sessions#new'               # displays login page 
post '/login' => 'sessions#create'           # processes login information

 #omniauth route we need when google sends back the request
get "/auth/:google_oauth2/callback" => 'sessions#google'
 
#my logout route
delete '/logout' => 'sessions#destroy'       
  
  resources :users
  #nested
  resources :comicbooks do
    resources :reviews, shallow: true
  end

end 

#NOTES TO MYSELF 

# https://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html#method-i-resources
#Generates shallow routes for nested resource(s). 
#When placed on a parent resource, generates shallow routes for all nested resources
#It is same as 
#resources :comicbooks do
     #resources :reviews, only: [:new, :create, :index]
#end 
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

