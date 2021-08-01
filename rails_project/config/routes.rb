Rails.application.routes.draw do

get '/auth/github/callback', to: 'sessions#create'


get '/register', to: 'users#new'
post '/users', to: 'users#create'

get '/login', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

get '/lists/new', to: 'lists#new'
post '/lists', to: 'lists#create'
get '/lists', to: 'lists#index'

resources :lists

get '/lists/:id', to: 'movies#new'
post '/movies', to: 'movies#create'

root to: 'application#home'

end
