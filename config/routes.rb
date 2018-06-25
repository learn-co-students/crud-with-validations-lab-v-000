Rails.application.routes.draw do
root 'songs#index'

resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
end
