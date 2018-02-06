Rails.application.routes.draw do

	resources :songs, only: [ :create, :update, :new, :edit, :show, :index, ]
	
	delete "/songs/:id", to: "songs#destroy"

end
