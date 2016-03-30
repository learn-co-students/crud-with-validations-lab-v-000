Rails.application.routes.draw do

	resources :songs, only: [:index, :show, :edit, :create, :new, :update, :destroy]

end
