Rails.application.routes.draw do
  post '/login' => 'auth#create'
  get '/getcomplist' => 'auth#index'
  resources :users, only: [:create, :destroy, :show, :update]
  resources :compositions, only: [:create, :show, :destroy, :update]
  resources :layers, only: [:create, :show, :destroy, :update]
  resources :user_compositions, only: [:create]
  delete '/user_compositions' => 'user_compositions#destroy'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
