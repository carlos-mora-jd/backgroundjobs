Rails.application.routes.draw do
  get 'rooms/show'

  get 'mensajes/new'
  resources :users
  root to: 'users#index'
  mount ActionCable.server => '/cable'
end
