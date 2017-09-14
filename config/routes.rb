Rails.application.routes.draw do
  resources :songs
  delete 'song/:id', to: 'people#destroy'
end
