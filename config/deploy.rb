# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'levumi2'
set :repo_url,  'levumi@levumi.informatik.uni-kiel.de:/var/git/levumi2.git'

# Default branch is :master
set :branch, 'production'

# Default deploy_to directory is /var/www/my_app_name 
set :deploy_to, '/var/www/levumi2'
set :deploy_via, :remote_cache

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml'

#Copy masterkey for credentials during deploy
append :linked_files, 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/images', 'public/javascript',  'public/packs', 'node_modules'

set :assets_roles, [] #Skip asset precompilation

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
