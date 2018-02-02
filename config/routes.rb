Rails.application.routes.draw do
  
  devise_for :users
  
  root 'static_pages#index'
  resources :games, only: [:new, :create, :show, :index]  do
	 	put 'move', to: 'games#move'
    put 'join', to: 'games#join'
  end
end
