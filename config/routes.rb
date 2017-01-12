Rails.application.routes.draw do
  get 'rooms/show'
  get 'mensajes/new'
  resources :users do
  	collection {post :import}
  end
  root to: 'users#index'
  mount ActionCable.server => '/cable'
end
