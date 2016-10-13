Rails.application.routes.draw do
  resources :songs, only: [:new, :create, :show, :edit, :update, :index]
  delete 'songs/:id', to: 'songs#destroy'
end
