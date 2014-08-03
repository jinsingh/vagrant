require_relative '../../../../spec_helper.rb'

describe 'capdplayauth::config', type: :class do
  it do
    should contain_file('/opt/capd-playauth/etc/play-authenticate/smtp.conf')
    should contain_file('/opt/capd-playauth/etc/play-authenticate/play-authenticate.conf')
    should contain_file('/opt/capd-playauth/etc/play-authenticate/play-easymail.conf')
    should contain_file('/etc/rsyslog.d/12-capplayauth.conf')
    should contain_file('/opt/capd-playauth')
    should contain_file('/opt/capd-playauth/etc')
    should contain_file('/opt/capd-playauth/etc/play-authenticate')
    should contain_file('/opt/capd-playauth/etc/capdplayauth.conf')
    should contain_file('/opt/capd-playauth/etc/play-authenticate/deadbolt.conf')
    should contain_file('/etc/init/capdplayauth.conf').with_content(/\/opt\/capd-playauth\/etc\/capdplayauth.conf/)
  end
end
