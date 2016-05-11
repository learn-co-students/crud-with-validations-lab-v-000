Rails.application.routes.draw do
  resources :songs
  resources :songs

  root "songs#index"
end