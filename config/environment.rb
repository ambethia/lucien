RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'chriseppstein-compass', :lib => 'compass', :source => 'http://gems.github.com/'
  config.gem 'haml', :lib => 'haml', :version => '>=2.2.0'
  config.time_zone = 'UTC'
  config.gem 'haml'
  config.gem 'authlogic'
  config.gem 'authlogic-oid', :lib => 'authlogic_openid'
  config.gem 'paperclip'
end
