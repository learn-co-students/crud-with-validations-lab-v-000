Rails.application.routes.draw do
  #resources :songs, only: [:show, :new, :create, :edit, :update, :index, :destroy]
  #patch 'songs/:id', to: 'songs#update'
  resources :songs
end
