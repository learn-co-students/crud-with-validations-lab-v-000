Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  #resources :sings, only: [:index, :show, :new, :create, :edit, :update]
end
