Rails.application.routes.draw do
  resources :songs, except: [:destroy]
end
