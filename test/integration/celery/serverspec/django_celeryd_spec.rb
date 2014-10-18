require 'serverspec'

describe file("/etc/default/celeryd-sample") do

  it { should be_file }

  it { should contain "CELERYD_CHDIR=/dummy/myproject" }

  it { should contain "ENV_PYTHON=/dummy/myvirtualenv/virtualenv/bin/python" }

  it { should contain 'CELERYD_MULTI="$ENV_PYTHON /dummy/myproject/manage.py deployed celery multi"' }

  it { should be_mode 744 }

  it { should be_owned_by 'root' }

  it { should be_grouped_into 'root' }

end

describe file("/etc/init.d/celeryd-sample") do

  it { should be_file }

  it { should be_owned_by 'root' }

  it { should be_grouped_into 'root' }

  it { should be_mode 755 }

  it { should contain "#!/bin/sh -e" }

  it { should contain 'DEFAULT_PID_FILE="/var/run/celery/celeryd-sample.pid"' }

  it { should contain 'DEFAULT_LOG_FILE="/var/log/celery/celeryd-sample.log"' }

  it { should contain 'CELERY_DEFAULTS=/etc/default/celeryd-sample' }

  it { should contain "exit 0" }

end

describe service("celeryd-sample") do

  it { should be_enabled }

end
