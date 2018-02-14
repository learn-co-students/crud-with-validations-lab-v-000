Rails.application.routes.draw do
  resources :songs, only: [:new, :create, :edit, :update, :index, :show, :destroy]
end
