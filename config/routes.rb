Rails.application.routes.draw do
  root to: "songs#index"

  resources :songs
end
