Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :edit, :create, :update]
  delete '/songs/:id', to: 'songs#destroy'
end
