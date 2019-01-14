Rails.application.routes.draw do
  resources :songs
  root 'songs#index'
#   get 'songs/:id/delete' => 'songs#delete', as: :destroy

end


# You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'songs/:id/delete' => 'songs#delete', as: :destroy
