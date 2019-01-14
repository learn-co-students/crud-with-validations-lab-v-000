Rails.application.routes.draw do
  root to: 'songs#index'
  #root 'pages#main'
  resources :songs

end
