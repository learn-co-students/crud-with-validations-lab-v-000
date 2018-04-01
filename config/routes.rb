Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

  root 'songs#index'

end
