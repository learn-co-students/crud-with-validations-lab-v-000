Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/show'

  get 'songs/edit'

  get 'songs/new'

  resources :songs
  resources :songs
  resources :songs
end
