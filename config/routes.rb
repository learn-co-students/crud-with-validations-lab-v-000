Rails.application.routes.draw do
  resources :songs
  delete 'song/:id', to: 'songs#destroy'
end
