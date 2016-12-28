Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit]
  patch 'songs/:id', to: 'songs#update'
  delete 'songs/:id', to: 'songs#destroy'
end
