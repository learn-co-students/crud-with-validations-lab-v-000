Rails.application.routes.draw do
  resources :songs

  delete 'songs/:id', to: 'songs#destroy'

  root "songs#index"
end
