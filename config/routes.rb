Rails.application.routes.draw do
  resources :songs
  delete '/songs/:id', to: "songs#destroy, as: 'song'"
end