##
lock '3.4.0'

set :user, 'deployer'
set :application, 'sicapun'
set :repo_url, 'git@github.com:udn/sicapun.git'
set :rvm_type, :user
set :rvm_ruby_version, '2.2.0@qontak-api'
set :unicorn_example, "config/unicorn/unicorn.rb"
set :branch, :master
set :use_sudo, false
set :bundle_binstubs, nil
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_files, %w{config/database.yml}
set :preload_app, true
namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
  desc 'Re-establish database.yml'
end

after 'deploy:publishing', 'deploy:restart'
before 'deploy:publishing', 'deploy:set_database_symlink'