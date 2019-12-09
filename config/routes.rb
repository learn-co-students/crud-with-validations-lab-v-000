Rails.application.routes.draw do
  root to: 'songs#index'
  resources :songs
  delete '/songs/:id', to: 'songs#destroy', as: 'delete_song'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
