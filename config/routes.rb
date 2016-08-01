Rails.application.routes.draw do 
  #resource :song
  resources :songs, only: [:index, :show, :new, :create, :edit]
  get 'songs', to: 'songs#index'
  patch 'songs/:id', to: 'songs#update'
  delete 'songs/:id', to: 'songs#destroy'
end
