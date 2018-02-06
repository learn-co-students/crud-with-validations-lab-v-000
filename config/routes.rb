Rails.application.routes.draw do
  resources :songs, only: [:new, :create, :show, :index, :edit, :update,:delete, :destroy]
end
