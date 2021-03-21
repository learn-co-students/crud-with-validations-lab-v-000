Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs
  #or
  # get '/songs', to: 'songs#index'
  # get '/songs/new', to: 'songs#new', as: 'new_song'
  # post '/songs', to: 'songs#create'
  # get '/songs/:id', to: 'songs#show', as: 'song'
  # get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
  # patch '/songs/:id', to: 'songs#update'
  # delete '/songs/:id', to: 'songs#destroy'
  #
  # root 'songs#index'
end
