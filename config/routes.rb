Rails.application.routes.draw do

  get "/songs", to: "songs#index"
  # get "/songs/new" to: "songs#new", as: "new_song"
  # post "/songs", to: "songs#create"

  root "songs#index"
end
