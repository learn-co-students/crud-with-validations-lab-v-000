Rails.application.routes.draw do
  resources :songs
  get '/' => 'songs#index'
end
