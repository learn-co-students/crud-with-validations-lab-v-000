Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  delete 'songs/:id', to: 'songs#destroy'
end
