Rails.application.routes.draw do
  # resources :songs
  get "songs/index", to: "songs#index", as: "songs"
  post "songs/index", to: "songs#index"
  get "songs/new", to: "songs#new", as: "new_song"
  get "/songs/:id", to: "songs#show", as: "song"
  post "/songs", to: "songs#create"
  get "/songs/:id/edit", to: "songs#edit", as: "edit_song"
  patch "/songs/:id", to: "songs#update"
  get "/songs/:id/destroy", to: "songs#destroy", as: "destroy_song"
 
end
