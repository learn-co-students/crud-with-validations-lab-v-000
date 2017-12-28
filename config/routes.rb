Rails.application.routes.draw do
  get 'songs/index'
  get 'songs/show'
  get 'songs/new'
  get 'songs/edit'
  resources :songs
end
