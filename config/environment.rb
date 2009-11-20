RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.gem 'haml'
  config.gem 'compass'
  config.gem 'authlogic'
  config.gem 'authlogic-oid', :lib => 'authlogic_openid'
  config.gem 'paperclip'
  config.gem 'amazon-ecs', :lib => 'amazon/ecs'
  config.gem 'jrails'
  config.gem 'acts-as-taggable-on'
end

Amazon::Ecs.options.merge!(
  YAML.load_file("#{RAILS_ROOT}/config/amazon.yml")[RAILS_ENV]
)
