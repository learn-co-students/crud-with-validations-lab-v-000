Rails.application.routes.draw do
  resources :songs, only: [:create, :show, :destroy, :update, :new, :index, :edit]
end
