Rails.application.routes.draw do
  resources :songs
  get '/', to: 'song#index'
end
