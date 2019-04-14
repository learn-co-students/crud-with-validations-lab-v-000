Rails.application.routes.draw do

  resources :songs
  delete 'song/:id', to: 'song#destroy'
end
