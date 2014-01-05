define :celery do
  name = params[:name]
  virtualenv = params[:virtualenv]
  project = params[:project]

  celeryd name do
    virtualenv virtualenv
    project project
  end

  celerybeat name do
    virtualenv virtualenv
    project project
  end

end
