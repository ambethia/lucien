ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resources :books, :member     => { :document => :get },
                        :collection => { :lookup   => :get }

  map.tags '/tags', :controller => 'tags'
  map.tags '/tags/*tags', :controller => 'tags', :action => 'tags'

  map.root :controller => 'application'
  map.namespace :admin do |admin|
    admin.root :controller => 'users', :action => 'index'
  end
end
