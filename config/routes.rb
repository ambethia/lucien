ActionController::Routing::Routes.draw do |map|
  map.resources :books, :member     => { :document => :get },
                        :collection => { :lookup   => :get }

  map.root :controller => 'application'
  map.namespace :admin do |admin|
    admin.root :controller => 'users', :action => 'index'
  end
end
