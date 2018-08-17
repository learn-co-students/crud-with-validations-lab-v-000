Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :show, :edit, :update, :create, :delete]
  delete '/songs/:id', to: 'songs#destroy'
end
