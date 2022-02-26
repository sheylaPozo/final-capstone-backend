Rails.application.routes.draw do
  resources :cars
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :login, only: [:index, :create]
      delete 'logout', to: 'login#destroy'\
      get 'cars', to: 'cars#index'
      resources :users, only: [:index] do
        get 'reservations', to: 'reservations#show'
        resources :cars do
          resources :reservations
        end
      end
    end
  end
end
