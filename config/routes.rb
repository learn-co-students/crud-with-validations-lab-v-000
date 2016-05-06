Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :show, :edit, :update]
  delete 'songs/:id', to: 'songs#destroy'
end
