Rails.application.routes.draw do
  resources :songs
  root 'songs#index'
end

# line 2 generates the following:

# get '/songs', to: 'songs#index'
# route is GET request to page that displays all songs and is mapped to #index action (method) in SongsController class

# get '/songs/new', to: 'songs#new', as: 'new_song'
# route is GET request to page that presents form to create a new song and is mapped to #new action (method) in SongsController class

# post '/songs', to: 'songs#create'
# route receives data submitted in form to create a new song and is mapped to #create action (method)

# get '/songs/:id', to: 'songs#show', as: 'song'
# route is GET request to show page that displays a single song instance, found by its id attribute value (whatever replaces :id route variable in URL)
# route is mapped to #show action (method) in SongsController class
# name of route is song, so route helper song_path(@song) will return the string URL path leading to song's show page

# get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
# route is GET request to page that presents form to edit song
# route is mapped to #edit action (method) in SongsController class, which implicitly renders edit form

# patch '/songs/:id', to: 'songs#update'
# route receives data submitted in form to edit song
# route is mapped to #update action (method) in SongsController class

# delete '/songs/:id', to: 'songs#destroy'
