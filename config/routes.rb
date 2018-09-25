Rails.application.routes.draw do
  resources :songs

  get '/', to: 'songs#index'
  get 'songs/index', to: 'songs#index'
end
