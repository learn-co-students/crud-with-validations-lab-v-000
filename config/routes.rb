Rails.application.routes.draw do
get '/songs', to: 'songs#index'
get '/songs/new', to: 'songs#new', as: "new_song"
post '/songs/new', to: 'songs#show', as: "song"
post '/songs', to: 'songs#create'
get '/songs/:id/edit', to: 'songs#edit'
patch '/songs/:id/edit', to: 'songs#update', as: "edit_song"
get '/songs/:id', to: 'songs#show'
delete '/songs/:id', to: 'songs#destroy'

end
