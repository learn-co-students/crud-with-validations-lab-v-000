Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  get "songs/:id/delete", to: "songs#destroy", as:"delete-song"
end
