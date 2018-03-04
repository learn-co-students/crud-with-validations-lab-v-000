Rails.application.routes.draw do
  resources :songs, only: [:show, :index, :new, :edit, :create, :update]
  get "/songs", to: "songs#index"
  get "/songs/new", to: "songs#new"
  post "/songs", to: "songs#create"
  get "/songs/:id", to: "songs#show"
  get "/songs/:id/edit", to: "songs#edit"
  patch "/songs/:id", to: "songs#update"
  delete "/songs/:id", to: "songs#destroy"
  
  root "songs#index"
end
