Rails.application.routes.draw do
  resources :songs
  get '/' => 'songs#index'
  get '/songs/:id/delete' => 'songs#destroy', :as => 'destroy_song'
end
