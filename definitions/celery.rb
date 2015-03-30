define :celery do

  name = params[:name]
  virtualenv = params[:virtualenv]
  project = params[:project]
  concurrency = params[:concurrency]
  workername = params[:workername]
  queues = params[:queues]

  celeryd name do
    virtualenv virtualenv
    project project
    concurrency concurrency
    workername workername
    queues queues
  end

  celerybeat name do
    virtualenv virtualenv
    project project
  end

end
