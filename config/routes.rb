Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :create, :new, :edit, :update, :destroy]
end
