require 'serverspec'

describe file("/etc/default/celerybeat-sample") do

  it { should be_file }

  it { should contain "CELERYBEAT_CHDIR=/dummy/myproject" }

  it { should contain "ENV_PYTHON=/dummy/myvirtualenv/virtualenv/bin/python" }

  it { should contain "CELERYBEAT=$ENV_PYTHON /dummy/myproject/manage.py deployed celery beat" }

  it { should be_mode 744 }

  it { should be_owned_by 'root' }

  it { should be_grouped_into 'root' }

end

describe file("/etc/init.d/celerybeat-sample") do

  it { should be_file }

  it { should be_owned_by 'root' }

  it { should be_grouped_into 'root' }

  it { should be_mode 755 }

  it { should contain "#!/bin/bash" }

  it { should contain 'DEFAULT_PID_FILE="/var/run/celery/celerybeat-sample.pid"' }

  it { should contain 'DEFAULT_LOG_FILE="/var/log/celery/celerybeat-sample.log"' }

  it { should contain 'CELERY_DEFAULTS=/etc/default/celeryd-sample.conf' }

  it { should contain 'CELERYBEAT_DEFAULTS=/etc/default/celerybeat-sample.conf' }

  it { should contain "exit 0" }

end

describe service("celerybeat-sample") do

  it { should be_enabled }

end
