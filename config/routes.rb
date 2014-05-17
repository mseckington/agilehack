Agilehack::Application.routes.draw do
  root to: 'homepage#index'

  get '/register', :to => 'registrations#new'
  post '/register', :to => 'registrations#create'

  get '/sign-in', :to => 'sessions#new', :as => 'sign_in'
  post '/sign-in', :to => 'sessions#create', :as => 'session'
  delete '/sign-in', :to => 'sessions#destroy'
end
