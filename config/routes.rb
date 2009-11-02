ActionController::Routing::Routes.draw do |map|
  map.resources :books, :member     => { :document => :get },
                        :collection => { :lookup   => :get }
  map.resources :users
  map.resource :account, :controller => "users"
  map.resource :user_session, :as => "session"

  map.root :controller => "books"
end
