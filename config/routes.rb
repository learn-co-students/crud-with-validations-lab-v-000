Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :update, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
