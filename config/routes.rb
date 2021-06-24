Rails.application.routes.draw do
  resources :caps
  namespace :api do
    namespace :v1 do

      post 'login', to: 'sessions#create'
      get '/profile', to: 'users#profile'

      get '/logout', to: 'sessions#logout'

      resources :breweries
    
      get '/capcheck', to: 'caps#update_cap'

      resources :users do
        resources :favorites
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
