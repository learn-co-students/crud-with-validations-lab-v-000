Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :edit]
  get '/songs/:id', to: 'songs#show', as: 'song'
  patch '/songs/:id', to: 'songs#update'
  delete '/songs/:id', to: 'songs#destroy'
  root 'songs#index'
end
