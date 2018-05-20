Rails.application.routes.draw do
  resources :songs,  only: [:index, :new, :edit, :create, :update, :delete, :show]
  root to: 'songs#index'
end
