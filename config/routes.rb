Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        member do
          get :products
        end
      end
      resources :products, only: [:index]
      get 'weather/:city', to: 'weather#show'
    end
  end
end