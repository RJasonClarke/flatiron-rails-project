Rails.application.routes.draw do

get '/auth/github/callback', to: 'sessions#create'


get '/register', to: 'users#new'
get '/login', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

resources :users

resources :lists do
    resources :movies, only: [:show, :index]
end

resources :movies



root to: 'application#home'

end
