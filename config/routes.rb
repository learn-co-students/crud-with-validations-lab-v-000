Rails.application.routes.draw do
  get 'songs/new', to: 'songs#new', as: :new_song
  get 'songs/:id', to: 'songs#show', as: :song
  get 'songs/:id/edit', to: 'songs#edit', as: :edit_song
  get 'index/', to: 'songs#index', as: :songs
  post 'index/', to: 'songs#create'
  patch 'songs/:id', to: 'songs#update'
  delete 'songs/:id', to: 'songs#destroy' 
end
