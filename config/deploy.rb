require 'thinking_sphinx/deploy/capistrano'

set :application,           "lucien"
set :repository,            "git@github.com:ambethia/#{application}.git"
set :deploy_to,             "/var/www/#{application}"
set :scm,                   :git
set :deploy_via,            :remote_cache
set :git_enable_submodules, true

role :web, "olivia"
role :app, "olivia"
role :db,  "olivia", :primary => true

ssh_options[:forward_agent] = true

namespace :deploy do

  desc "Symlink shared directories into current path"
  task :shared do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/amazon.yml #{release_path}/config/amazon.yml"
    run "ln -nfs #{shared_path}/authentication_engine.yml #{release_path}/config/authentication_engine.yml"
    run "ln -nfs #{shared_path}/assets #{release_path}/db/assets"
  end

  desc 'Generate and install the Sprockets concatenated JavaScript file'
  task :sprockets, :roles => :app do
    run "cd #{release_path} && rake RAILS_ENV=production sprockets:install_script"
  end

  desc "Update the crontab file"
  task :whenever, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end

  desc "Update sphinx configuration and re-index"
  task :sphinx, :roles => :db do
    thinking_sphinx.stop
    thinking_sphinx.index
    thinking_sphinx.start
  end

  desc "Restart Passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t.to_s.capitalize} task is a no-op with Passenger"
    task t, :roles => :app do; end
  end
end

before 'deploy:migrate', 'deploy:shared'
after  'deploy:symlink', 'deploy:shared', 'deploy:sprockets',
                         'deploy:sphinx', 'deploy:whenever'
