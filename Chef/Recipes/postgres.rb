package 'postgresql'

service 'postgresql' do
  action [:enable, :start]
end