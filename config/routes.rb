ActionController::Routing::Routes.draw do |map|
  map.resources :heritages

  map.resources :storages

  map.resources :calendars

  map.resources :procurements

  map.resources :registers

  map.resources :properties

  map.resources :areas

  map.resources :charters

  map.resources :groups

  map.resources :documents





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
  map.resources :people
  map.resources :person, :controller => "people"
  map.resources :admin

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
