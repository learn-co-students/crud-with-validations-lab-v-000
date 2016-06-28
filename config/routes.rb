Rails.application.routes.draw do
	 # get "/songs/index", to: "songs#index", as: "songs"
	 # get "/songs/edit", to: "songs#edit", as: "edit_song"
	 # post "/songs", to: "songs#create"
	 # get "/songs/new", to: "songs#new", as: "new_song"
	 # get "/songs/:id", to: "songs#show", as: "song"
	 # patch "/songs/:id", to: "songs#update"
	 
	 # resources :songs, only: [:show, :new, :create, :update]
	 resources :songs
end
