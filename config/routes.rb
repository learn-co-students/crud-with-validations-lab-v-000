Rails.application.routes.draw do
  # need to add root 'songs#index'
  resources :songs
end
