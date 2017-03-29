Rails.application.routes.draw do
  get 'sessions/new'
  get 'signup', to: 'user#new', as: 'signup'
  get 'login', to: 'sessions#new', as:'logout'
    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  resources :users do
  	  resources :events
  	end 
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
