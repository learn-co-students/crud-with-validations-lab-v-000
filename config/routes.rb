Rails.application.routes.draw do
  resources :songs

  root 'controller#index'
end
