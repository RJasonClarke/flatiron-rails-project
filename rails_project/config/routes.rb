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

    #omniauth routes
    get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

    #logout routes
    delete '/logout', to: 'sessions#destroy'


  resources :users do
    resources :jobs
  end

  resources :jobs do
    resources :job_tools
  end

  resources :job_tools

  resources :tools, only: [:index, :show]

end
