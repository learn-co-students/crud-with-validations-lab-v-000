Rails.application.routes.draw do


  resources :songs, only: [:new, :index, :destroy, :show, :edit, :update, :create]
end
