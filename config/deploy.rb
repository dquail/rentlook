set :application, 'rentlook'
set :user, 'rentloo'
set :domain, '68.233.9.243'
#set :mongrel_port, 'put_your_assigned_mongrel_port_number_here'
set :server_hostname, '68.233.9.243'

set :git_account, 'dquail'

set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('helama28: ') }

role :web, server_hostname
role :app, server_hostname
role :db, server_hostname, :primary => true

#default_run_options[:pty] = true
set :repository,  "git@github.com:#{git_account}/#{application}.git"
set :scm, :git
#set :scm_username, "quail.david@gmail.com"
#set :scm_passphrase, "helama28"


ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"



# =============================================================================
# FCGI TASKS
# =============================================================================

# Uncomment these tasks if using FCGI to serve your Rails Application

desc "FCGI is already running, so we don't really need the spinner script, but we have it create the initial symlink for us"
task :spinner, :roles => :app do
  run "rm -rf /home/#{user}/public_html;ln -s #{current_path}/public /home/#{user}/public_html"
end

desc "Restart the FCGI Process"
task :restart, :roles => :app do
  run "cd #{current_path}; killall dispatch.fcgi"
  cleanup
end