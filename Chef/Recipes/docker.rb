# docker.rb

# Update package index
execute 'update_apt' do
    command 'apt update -y'
    action :run
  end
  
  # Install Docker
  package 'docker.io' do
    action :install
  end
  
  # Install Docker Compose
  remote_file '/usr/local/bin/docker-compose' do
    source "https://github.com/docker/compose/releases/latest/download/docker-compose-#{node['kernel']['name']}-#{node['kernel']['machine']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
  
  # Set permissions for Docker socket
  file '/var/run/docker.sock' do
    mode '0666'
    action :touch
  end
  
  # Start and enable Docker service
  service 'docker' do
    action [:start, :enable]
  end