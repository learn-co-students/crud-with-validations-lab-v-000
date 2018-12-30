Rails.application.routes.draw do
  get "/songs", to: "songs#index"
  get "/songs:id", to: "songs#show", as: "song"
  get "/songs/new", to: "songs#new", as: "new_song"
  get "/songs/:id/edit", to: "songs#edit", as: "edit_song"
  post "/songs", to: "songs#create"
  patch "/songs/:id", to: "songs#update"
  delete "/songs/:id", to: "songs#destroy"

  root "songs#index"
  
end
