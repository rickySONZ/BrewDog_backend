Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      post 'login', to: 'sessions#create'
      get '/profile', to: 'users#profile'
      get '/logout', to: 'sessions#logout'

      resources :breweries

      resources :users do
        resources :favorites
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
