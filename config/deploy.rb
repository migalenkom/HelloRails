# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'HelloRails'
set :repo_url, 'git@github.com:migalenkom/HelloRails.git'

# Default branch is :rails4
#  set :branch,fetch(:branch, 'rails4')
 # ask :rails4,`git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "rails4"

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end
