Rails.application.routes.draw do
  get 'songs/edit'

  get 'songs/index'

  get 'songs/new'

  get 'songs/show'

  resources :songs

end
