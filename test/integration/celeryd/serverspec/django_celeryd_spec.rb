require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe file("/etc/default/sample") do

  it { should be_file }

  it { should contain "CELERYD_CHDIR=" }

  it { should contain "CELERYD_MULTI=" }

  it { should contain "ENV_PYTHON=" }

  it { should be_mode 744 }

  it { should be_owned_by 'root' }

  it { should be_grouped_into 'root' }

end


# describe service("celeryd-sample") do

#   it { should be_running }

# end
