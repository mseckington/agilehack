Agilehack::Application.routes.draw do
  root to: 'homepage#index'

  get '/register', :to => 'registrations#new'
  post '/register', :to => 'registrations#create'

  get '/sign-in', :to => 'sessions#new', :as => 'sign_in'
  post '/sign-in', :to => 'sessions#create', :as => 'session'
  delete '/sign-in', :to => 'sessions#destroy'

  resources :guests, only: [:index]
  resources :achievements, only: [:index]

  resources :user_achievements, only: [:create]

  scope "/api/v1" do
    scope "/guests" do
      get ":guest_id" => "guests#show"
    end
  end
end
