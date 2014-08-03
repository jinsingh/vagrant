require_relative '../../../../spec_helper.rb'

describe 'capdsendmail::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/17-capdsendmail.conf').
	    with_ensure('present')
    should contain_file('/etc/init/capdsendmail.conf').
	    with_ensure('present')
    should contain_file('/opt/capdsendmail/sendEmailServiceConfiguration.yml').
	    with_ensure('present')
    should contain_file('/opt/capdsendmail').
	    with_ensure('directory')
  end
end
