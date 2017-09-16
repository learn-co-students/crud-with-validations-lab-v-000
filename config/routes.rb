Rails.application.routes.draw do
  root to: 'songs#index'
  resources :songs, only: [:show, :new, :create, :edit, :update, :index, :destroy]
  patch 'songs/:id', to: 'songs#update'
end
