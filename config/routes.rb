ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home', :action => 'index'

  map.resources :publications
  map.resources :attachments
  map.resources :zones
  map.resources :countries
  map.resources :provinces
  map.resources :cities
  map.resources :addresses
  map.resources :contacts
  map.resources :sectors
  map.resources :reports


  map.resource :user_session
  map.logout   '/logout',   :controller => 'user_sessions', :action => 'destroy'
  map.login    '/login',    :controller => 'user_sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup   '/signup',   :controller => 'users', :action => 'new'
  map.resource :account, :controller => "users"
  map.resources :accounts
  map.resources :users


  # The priority is based upon order of creation: first created -> highest priority.


end
