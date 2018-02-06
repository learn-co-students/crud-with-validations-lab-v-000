Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :show, :edit, :update, :create]
   get "song/:id/delete", to: "songs#destroy", as: "song_delete"
end
