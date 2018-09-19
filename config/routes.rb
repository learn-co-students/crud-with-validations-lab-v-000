Rails.application.routes.draw do
  resources :songs, only: [:new, :create, :index, :edit, :update, :delete ]
end
