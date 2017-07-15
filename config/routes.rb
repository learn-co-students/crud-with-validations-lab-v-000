Rails.application.routes.draw do
  resources :songs,only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
