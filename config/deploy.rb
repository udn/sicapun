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


##
root = "/home/deployer/apps/sicapun/current"
working_directory root

pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

worker_processes 2
# worker_processes Integer(ENV['WEB_CONCURRENCY'])
timeout 30
preload_app true

# listen '/tmp/unicorn.spui.sock', backlog: 64
listen 8080

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV['BUNDLE_GEMFILE'] = File.join(root, 'Gemfile')
end
##


after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end