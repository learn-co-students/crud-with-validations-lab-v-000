Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :show, :create, :edit, :update, :destroy]
end
