# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

#Require everything (bundler, rails/assets and rails/migrations):
require 'capistrano/setup'               # 加载 Cap 的 DSL
require 'capistrano/deploy'              # 加载 Cap 的 Workflow
require 'capistrano/rvm'                 # 加载 RVM 相关配置
# require 'capistrano/rbenv'             # 加载 Rbenv 相关配置
require 'capistrano/bundler'             # 加载 Bundle, 以便完成 bundle install
require 'capistrano/rails/assets'        # 加载 Rails 的 js, css 文件预编译
require 'capistrano/rails/migrations'    # 加载 Rails 的数据库自动迁移
require 'capistrano3/unicorn'            # 加载 Unicorn 服务

# Or require just what you need manually:

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'
# require 'capistrano/passenger'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
