Rails.application.routes.draw do
  resources :songs
  get '/songs' => 'songs#index'
  get '/songs/:id' => 'songs#show'
  get '/songs/new' => 'songs#new'
  post '/songs' => 'songs#create'
  get '/songs/:id/edit' => 'songs#edit'
  post '/songs/:id' => 'songs#update'
  delete '/songs/:id' => 'songs#destroy'

  root 'songs#index'
end
