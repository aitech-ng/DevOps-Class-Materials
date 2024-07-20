git '/var/www/html' do
    repository 'https://github.com/GerromeSieger/Static-Site.git'
    action :sync
  end
  
  service 'nginx' do
    action :restart
  end