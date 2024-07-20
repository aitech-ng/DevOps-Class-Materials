app_dir = '/root/React-Site'
monitoring_dir = '/root/Monitoring-Logging'

execute 'docker-compose up for application' do
    command 'docker-compose up -d'
    cwd app_dir
    action :run
  end
  
  execute 'docker-compose up for monitoring (redeploy)' do
    command 'docker-compose up -d'
    cwd monitoring_dir
    action :run
  end