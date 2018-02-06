Rails.application.routes.draw do
  resources :songs, only:[:show, :index, :create, :new, :edit, :update, :destroy]
end
