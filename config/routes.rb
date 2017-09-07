Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :show]
end
