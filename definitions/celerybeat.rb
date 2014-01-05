define :celerybeat do

  template "/etc/default/celerybeat-#{params[:name]}" do
    source 'celerybeat.conf.erb'
    cookbook 'django-celery'
    mode '0744'
    variables ({
      :project => params[:project],
      :virtualenv => params[:virtualenv]
    })
  end

  template "/etc/init.d/celerybeat-#{params[:name]}" do
    source 'celerybeat.erb'
    cookbook 'django-celery'
    mode '0755'
    variables ({
      :name => params[:name]
    })
  end

  service "celerybeat-#{params[:name]}" do
    init_command "/etc/init.d/celerybeat-#{params[:name]}"
    action :enable
  end

end
