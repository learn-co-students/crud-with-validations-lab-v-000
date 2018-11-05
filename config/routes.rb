Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :edit, :show, :create, :update, :destroy]
end
