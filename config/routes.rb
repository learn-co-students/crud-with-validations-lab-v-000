Rails.application.routes.draw do
  get '/songs/index', to: 'songs#index'
  resources :songs
end
