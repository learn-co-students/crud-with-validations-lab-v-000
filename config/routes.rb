Rails.application.routes.draw do
  resources :songs, only: [:new, :index, :show, :edit, :destroy, :create, :update]
end
