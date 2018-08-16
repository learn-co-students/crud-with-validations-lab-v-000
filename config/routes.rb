Rails.application.routes.draw do
  resources :songs, only: [:show, :new, :edit, :create, :update]
  delete '/songs/:id', to: 'songs#destroy, as:'song'
end
