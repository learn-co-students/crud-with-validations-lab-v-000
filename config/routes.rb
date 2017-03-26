Rails.application.routes.draw do
  resources :songs #, only: [:show, :new, :create, :edit, :update]

#  get '/', to: 'songs#index', as: :index
end
