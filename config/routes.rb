Rails.application.routes.draw do
  get 'mensajes/new'
  resources :users do
  	collection {post :import}
  end
  root to: 'users#index'
end
