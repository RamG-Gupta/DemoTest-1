Rails.application.routes.draw do
  get 'sessions/new'
  get 'signup', to: 'user#new', as: 'signup'
  get 'login', to: 'sessions#new', as:'logout'
    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


      match "events_like/:event_id" => "likes#create", :via => 'post'
      match "events_like/:event_id" =>  "likes#index", :via => 'get'
      match "posts_like/:post_id" => "likes#create_post", :via => 'post'
      match "posts_like/:post_id" => "likes#index_post", :via => 'get'


  resources :users do
  	  resources :events do 
        resources :posts
      end
     
  	end 
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
