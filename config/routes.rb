Rails.application.routes.draw do
  resources :songs
  get :root, to: "songs#index"
end
