celery "sample" do
  virtualenv '/dummy/myvirtualenv'
  project '/dummy/myproject'
end

celery "sample-with-options" do
  virtualenv '/dummy/myvirtualenv'
  project '/dummy/myproject'
  concurrency '5'
  workername 'sample-worker'
  queues ['one', 'two']
end
