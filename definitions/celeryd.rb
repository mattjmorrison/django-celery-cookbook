define :celeryd do

  template "/etc/default/celeryd-#{params[:name]}" do
    source 'celeryd.conf.erb'
    cookbook 'django-celery'
    mode '0744'
    variables ({
      :project => params[:project],
      :virtualenv => params[:virtualenv],
      :concurrency => params[:concurrency],
      :workername => params[:workername],
      :queues => params[:queues]
    })
  end

  template "/etc/init.d/celeryd-#{params[:name]}" do
    source 'celeryd.erb'
    cookbook 'django-celery'
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
