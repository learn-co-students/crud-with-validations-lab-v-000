Rails.application.routes.draw do
  resources :songs, only:[:index,:create, :new, :show, :edit, :update]
  get "/songs/:id/delete", to: "songs#destroy", as: "delete_song"
end
