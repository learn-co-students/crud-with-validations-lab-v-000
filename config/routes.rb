Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :edit, :update, :new, :create, :destroy]
end
