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
    run "ln -nfs #{shared_path}/assets #{release_path}/db/assets"
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

before "deploy:migrate", "deploy:shared"
after  "deploy:symlink", "deploy:shared"
