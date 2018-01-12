Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/show'

  get 'songs/new'

  get 'songs/create'

  get 'songs/edit'

  get 'songs/update'

  get 'song/index'

  get 'song/show'

  get 'song/new'

  get 'song/create'

  get 'song/edit'

  get 'song/update'

  resources :songs
end
