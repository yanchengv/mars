require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/unicorn'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)
require "mina_sidekiq/tasks"

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, 'www.balawo.com'
set :deploy_to, '/home/balawo/deploy/mars'
set :repository, 'git@github.com:yanchengv/mars.git'
set :branch, 'dev'
set :term_mode, :system
set :keep_releases,   5
set :unicorn_pid, "#{deploy_to}/tmp/pids/unicorn.pid"
set :sidekiq_pid, "#{deploy_to}/tmp/pids/sidekiq.pid"

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml','log','tmp/pids/unicorn.pid']
#set :shared_paths, ['config/database.yml', 'log','tmp/sockets', 'tmp/pids']

# Optional settings:
set :user, 'balawo'    # Username in the server to SSH to.
set :port, '22'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
  invoke :'rvm:use[ruby-2.3.1]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do

  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]

  queue  %[echo "-----> Be sure to edit '#{deploy_to}/shared/config/database.yml' and 'secrets.yml'."]


  queue! %[mkdir -p "#{deploy_to}/tmp/sockets/"]
  queue! %[mkdir -p "#{deploy_to}/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/tmp/pids"]

end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'unicorn:stop'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'sidekiq:quiet'
      invoke :'sidekiq:restart'
      invoke :'unicorn:restart'

    end
  end

end

desc "Shows logs."
task :logs do
  queue %[cd #{deploy_to!} && tail -f shared/log/production.log]
end