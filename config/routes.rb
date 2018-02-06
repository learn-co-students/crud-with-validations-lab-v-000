Rails.application.routes.draw do
  resources :songs
  get '/', to: 'songs#index', as: 'index'
end
