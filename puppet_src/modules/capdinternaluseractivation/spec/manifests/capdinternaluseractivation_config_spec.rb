require_relative '../../../../spec_helper.rb'

describe 'capdinternaluseractivation::config', type: :class do
  it do
    should contain_cron('capdinternaluseractivation').
      with_ensure('present')
    should contain_file('/etc/rsyslog.d/23-capdinternaluseractivation.conf').
	    with_ensure('present')
    should contain_file('/opt/capdinternaluseractivation').
	    with_ensure('directory')
    should contain_file('/opt/capdinternaluseractivation/capdinternaluseractivation_batch.sh').
	    with_ensure('present')
    should contain_file('/opt/capdinternaluseractivation/InternalUserDeactivationConfiguration.yml').
	    with_ensure('present')
    should contain_file('/opt/capdinternaluseractivation/InternalUserReactivationConfiguration.yml').
      with_ensure('present')
    should contain_file('/opt/capdinternaluseractivation/InternalUserReactivationConfiguration_test.yml').
      with_ensure('present')
  end
end
