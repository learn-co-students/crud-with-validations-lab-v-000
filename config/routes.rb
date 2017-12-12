Rails.application.routes.draw do

  get '/songs/new', to: 'songs#new', as: 'new_song'
  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show', as: 'song'
  post '/songs', to: 'songs#create'
  get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
  patch '/songs/:id', to: 'songs#update'
  delete '/songs/:id', to: 'songs#destroy'

  root 'songs#index'

end
