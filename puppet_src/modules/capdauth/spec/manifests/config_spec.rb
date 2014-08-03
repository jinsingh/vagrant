require_relative '../../../../spec_helper.rb'

describe 'capdauth::config', type: :class do
  it do
    should contain_file('/etc/init/capdauth.conf').
	    with_ensure('present')
    should contain_file('/etc/rsyslog.d/10-capauth.conf').
	    with_ensure('present')
    should contain_file('/opt/capdauth').
	    with_ensure('directory')
    should contain_file('/opt/capdauth/authConfig.yml').
	    with_ensure('present').
	    with_content(/5000/).
	    with_content(/5001/)
  end
end
