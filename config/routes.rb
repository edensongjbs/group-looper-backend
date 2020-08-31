Rails.application.routes.draw do
  resources :users, only: [:create, :delete, :show, :update]
  resources :compositions, only: [:create, :show, :delete, :update]
  resources :layers, only: [:create, :show, :delete, :update]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
