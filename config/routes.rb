Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :songs, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  #get '/songs', to: 'songs#index'
  #get '/songs/new', to: 'songs#new', as: 'new_song'
  #get '/songs/:id', to: 'songs#show'
  #get '/songs/:id/edit', to: 'songs#edit'
  #post '/songs', to: 'songs#create'
  #patch '/songs/:id', to: 'songs#update'
  #delete '/songs/:id', to: 'songs#destroy'
end
