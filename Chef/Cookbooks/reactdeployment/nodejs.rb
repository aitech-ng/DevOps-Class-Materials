node_repo_file = '/etc/apt/sources.list.d/nodesource.list'

execute 'add_nodejs_repo' do
  command 'curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh'
  not_if { ::File.exist?(node_repo_file) }
end

package ['nodejs', 'yarn'] do
  action :install
end