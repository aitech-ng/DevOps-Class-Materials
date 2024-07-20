git '/root/React-Site' do
    repository 'https://github.com/GerromeSieger/React-Site.git'
    action :sync
  end
  
  execute 'install_dependencies' do
    command 'npm install'
    cwd '/root/React-Site'
  end
  
  execute 'build_app' do
    command 'npm run build'
    cwd '/root/React-Site'
  end
  
  execute 'copy_build' do
    command 'cp -r /root/React-Site/build/* /var/www/html'
  end
  
  service 'nginx' do
    action :restart
  end