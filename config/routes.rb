Rails.application.routes.draw do
  resources :songs #, except: :destroy
  #delete 'songs/:id', to: 'songs#destroy', as: :delete_song

end
