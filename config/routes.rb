Rails.application.routes.draw do

  resources :songs, only: [:index, :new, :create, :update, :edit, :show]
  delete "/songs/:id", to: "songs#destroy"


end
