Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :edit, :delete, :update]
end
