set :port, 22
set :user, 'mike'
set :deploy_via, :remote_cache
set :use_sudo, false

server '109.122.62.17',
       roles: [:web, :app, :db],
       port: fetch(:port),
       user: fetch(:user),
       primary: true

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options, {
                    forward_agent: true,
                    # auth_methods: %w(publickey),
                    user: 'mike',
                }

set :rails_env, :production
set :conditionally_migrate, true