Rails.application.routes.draw do
  resources :songs, only: [:new, :edit, :create, :update, :show, :index, :destroy]
  # skip_before_filter :verify_authenticity_token, :only => [:destroy]
  # delete 'songs/:id', to: 'songs#destroy'
  
end
