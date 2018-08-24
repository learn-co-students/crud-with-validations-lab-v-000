Rails.application.routes.draw do
  resources :songs, except: :destroy
  delete 'songs/:id' => 'songs#destroy', :as => :destroy
end
