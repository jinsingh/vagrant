require_relative '../../../../spec_helper.rb'

describe 'capdmockidahub::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/13-capdmockidahub.conf')
    should contain_file('/opt/capd-mocks-play-ida-hub')
    should contain_file('/opt/capd-mocks-play-ida-hub/etc')
    should contain_file('/opt/capd-mocks-play-ida-hub/etc/capdmockidahub.conf')
    should contain_file('/etc/init/capdmockidahub.conf').with_content(/\/opt\/capd-mocks-play-ida-hub\/etc\/capdmockidahub.conf/)
  end
end
