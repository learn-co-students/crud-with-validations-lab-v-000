Rails.application.routes.draw do
  resources :songs, only: [:new, :create, :index, :edit, :show, :update, :destroy ]
end
