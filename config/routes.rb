Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
  delete "/songs/:id", to: "songs#destroy"
  root "songs#index"
end
