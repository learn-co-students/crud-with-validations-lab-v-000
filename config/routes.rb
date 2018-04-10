Rails.application.routes.draw do
  resources :songs, only: [:index, :edit, :new, :create, :show, :update, :destroy]
end
