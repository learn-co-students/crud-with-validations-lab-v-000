Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  delete 'songs/:id', to: 'songs#destroy'
end
