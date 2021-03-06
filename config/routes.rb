Rails.application.routes.draw do
  root 'searches#show'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  post '/search', to: 'searches#search'


  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :items, only: [:index, :show, :destroy, :create]
    end
  end

end
