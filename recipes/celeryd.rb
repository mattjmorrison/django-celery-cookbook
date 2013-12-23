
template '/etc/default/sample' do
  source 'celeryd.conf.erb'
  owner 'root'
  group 'root'
  mode '0744'
end
