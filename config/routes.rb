Rails.application.routes.draw do
  resources :songs
  # delete '/song/:id', to: 'song#destroy', as:'destroy_song'
end
