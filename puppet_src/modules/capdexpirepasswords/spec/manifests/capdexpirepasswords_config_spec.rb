require_relative '../../../../spec_helper.rb'

describe 'capdexpirepasswords::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/31-capdexpirepasswords.conf').
	    with_ensure('present')
    should contain_cron('capdexpirepasswords').
	    with_ensure('present')
    should contain_file('/opt/capdexpirepasswords').
	    with_ensure('directory')
    should contain_file('/opt/capdexpirepasswords/expirepasswords.properties').
	    with_ensure('present')
    should contain_file('/opt/capdexpirepasswords/expire-passwords.sh').
	    with_ensure('present')
  end
end
