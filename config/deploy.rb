# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'mars'
set :repo_url, 'git@github.com:yanchengv/mars.git'
set :deploy_to, '/home/balawo/deploy/mars'
set :deploy_user, :balawo

set :scm, :git
set :format, :pretty
set :log_level, :debug

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

set :rvm_type, :user
set :rvm_ruby_version, '2.3.1'
set :rvm_roles, [:app, :web, :db]

set :keep_releases, 3


after 'deploy:publishing', 'deploy:restart'

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :restart do
    invoke 'unicorn:restart'
  end

end

#  cap production logs:tail 命令实时查看production.log
namespace :logs do
  desc "tail rails logs"
  task :tail do
    on roles(:app) do
      execute "tail -f #{deploy_to}/shared/log/#{fetch(:rails_env)}.log"
    end
  end
end
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
