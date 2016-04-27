Rails.application.routes.draw do
  resources :songs
  root 'song#index'
end
