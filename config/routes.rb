Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :edit, :create, :update]
  delete 'song/:id', to: 'songs#destroy'
end
