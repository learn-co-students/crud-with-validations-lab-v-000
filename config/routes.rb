Rails.application.routes.draw do
  resources :songs
  root 'songs#index'
  delete "/songs/:id", to: "songs#destroy"
end
