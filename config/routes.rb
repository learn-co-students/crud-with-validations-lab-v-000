Rails.application.routes.draw do
  resources :songs


  //set homepage
  root "songs#index"
end
