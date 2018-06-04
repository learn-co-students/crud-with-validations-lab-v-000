Rails.application.routes.draw do
  resources :songs
end

# generates:
#   get "/songs" -- index
#   get "/songs/:id" -- show
#   get "/songs/new" -- new method
#   post "/songs" -- create
#   get "/songs/:id/edit" -- edit method
#   put "/songs/:id" -- update
#   patch "/songs/:id" -- update
#   delete "/songs/:id" -- destroy 
