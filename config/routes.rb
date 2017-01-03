Rails.application.routes.draw do
  get 'mensajes/new'
  resources :users
  root to: 'users#index'
end
