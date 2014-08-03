require_relative '../../../../spec_helper.rb'

describe 'capdmatching::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/15-capdmatching.conf').
	    with_ensure('present')
    should contain_file('/etc/init/capdmatching.conf').
	    with_ensure('present')
    should contain_file('/opt/capdmatching').
	    with_ensure('directory')
    should contain_file('/opt/capdmatching/matchingConfig.yml').
	    with_ensure('present').with_content(/192.168.99.111:80/)
  end
end
