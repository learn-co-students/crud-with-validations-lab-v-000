Rails.application.routes.draw do
  resources :songs
  #get '/songs', to: 'songs#index'
  #post '/songs', to: 'songs#create'

  #get '/songs/index', to: "songs#index"

  #get '/songs/new', to: "songs#new", as: "new_song"
  #get '/songs/:id', to: 'songs#show', as: "song_path"
  #get '/songs/:id/edit', to: "songs#edit", as: "edit_song"

  #patch '/songs/:id', to: 'songs#update'
  #delete '/songs/:id', to: 'songs#destroy'
end
