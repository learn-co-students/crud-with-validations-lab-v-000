Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :show, :create, :edit, :update]
  delete 'songs/:id', to: 'songs#destroy'
end
