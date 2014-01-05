define :celeryd do

  template "/etc/default/celeryd-#{params[:name]}" do
    source 'celeryd.conf.erb'
    cookbook 'django'
    mode '0744'
    variables ({
      :project => params[:project],
      :virtualenv => params[:virtualenv]
    })
  end

  template "/etc/init.d/celeryd-#{params[:name]}" do
    source 'celeryd.erb'
    cookbook 'django'
    mode '0755'
    variables ({
      :name => params[:name]
    })
  end

  service "celeryd-#{params[:name]}" do
    init_command "/etc/init.d/celeryd-#{params[:name]}"
    action :enable
  end

end