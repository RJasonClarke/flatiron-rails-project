Rails.application.routes.draw do

get '/register', to: 'users#new'
post '/users', to: 'users#create'

get '/login', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

get '/lists/new', to: 'lists#new'
post '/lists', to: 'lists#create'
get '/lists', to: 'lists#index'

root to: 'application#home'

end
