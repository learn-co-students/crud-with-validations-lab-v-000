Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/new'

  get 'songs/create'

  get 'songs/show'

  get 'songs/edit'

  resources :songs
end
