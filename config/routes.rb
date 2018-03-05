Rails.application.routes.draw do
  get '/', to: 'songs#index'
  resources :songs
end
