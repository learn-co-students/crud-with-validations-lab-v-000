Rails.application.routes.draw do
  resources :songs
  root "songs#index"
  # get '/' => "songs#index"
end
