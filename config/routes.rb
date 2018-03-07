Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
  get 'songs/:id', to: 'songs#show'
  get "songs/:id/edit", to: "songs#edit"
  patch 'songs/:id', to: 'songs#update'
  delete 'songs/:id', to: 'songs#destroy'

end
