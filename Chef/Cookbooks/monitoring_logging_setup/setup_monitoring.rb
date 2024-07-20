app_dir = '/root/React-Site'
monitoring_dir = '/root/Monitoring-Logging'

git monitoring_dir do
    repository 'https://github.com/GerromeSieger/Monitoring-Logging.git'
    revision 'main'
    action :sync
  end
  
  execute 'docker-compose up for monitoring' do
    command 'docker-compose up -d'
    cwd monitoring_dir
    action :run
  end