Rails.application.routes.draw do
  resources :songs

  get 'songs/index' => 'songs#index'
  get 'songs/:id' => 'songs#show'

end
