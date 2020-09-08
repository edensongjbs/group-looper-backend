Rails.application.routes.draw do
  post '/login' => 'auth#create'
  resources :users, only: [:create, :destroy, :show, :update]
  resources :compositions, only: [:create, :show, :destroy, :update]
  resources :layers, only: [:create, :show, :destroy, :update]
  resources :user_compositions, only: [:create, :destroy]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
