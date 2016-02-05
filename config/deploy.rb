##
lock '3.4.0'

set :application, 'sicapun'
set :repo_url, "git@github.com:udn/sicapun.git"
set :rvm_type, :user
set :rvm_ruby_version, '2.2.0@qontak-api'
set :unicorn_example, "config/unicorn/unicorn.rb"
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, :master
set :use_sudo, false
set :bundle_binstubs, nil
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :preload_app, true

namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
  desc 'run bundle install'
  task :install_bundle do
    run "cd #{current_path} && bundle install"
  end
end

after 'deploy:publishing', 'deploy:restart'
after "deploy", 'deploy:install_bundle'
