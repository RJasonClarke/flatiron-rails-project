Rails.application.routes.draw do

get '/register', to: 'users#new'
post '/users', to: 'users#create'

root to: 'application#home'

end
