Rails.application.routes.draw do

  #home page
  root 'application#home'

  #custom routes
    #register routes
    get '/register', to: 'users#new'
    post '/register', to: 'users#create'

    #login routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    #logout routes
    delete '/logout', to: 'sessions#destroy'


  resources :users
  resources :jobs
end
