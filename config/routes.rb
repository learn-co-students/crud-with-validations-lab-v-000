Rails.application.routes.draw do
  resources :songs, only: %i[index show new create edit update destroy]
end
