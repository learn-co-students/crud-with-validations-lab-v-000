Rails.application.routes.draw do
  resources :songs, only: [:show, :new, :create, :edit, :update]
end
