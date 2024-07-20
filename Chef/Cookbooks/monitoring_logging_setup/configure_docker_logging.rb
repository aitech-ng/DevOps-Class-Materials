docker_plugin 'loki' do
    plugin_name 'grafana/loki-docker-driver:latest'
    alias 'loki'
    action :install
  end
  
  file '/etc/docker/daemon.json' do
    content JSON.pretty_generate({
      'log-driver' => 'loki',
      'log-opts' => {
        'loki-url' => 'http://localhost:3100/loki/api/v1/push',
        'loki-batch-size' => '400'
      }
    })
    notifies :restart, 'service[docker]', :immediately
  end
  
  service 'docker' do
    action [:enable, :start]
  end