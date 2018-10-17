Rails.application.routes.draw do
  resources :songs
   root :to => "song#index"
end
