cookbook_file 'script.sh' do
    source 'script.sh'
    mode '0755'
    action :create
  end

  execute 'run remote script' do
    command './script.sh'
    action :run
  end