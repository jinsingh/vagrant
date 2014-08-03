require_relative '../../../../spec_helper.rb'

describe 'hosts', :type => :class do
  it do
    should contain_host('capservices.rpa.spec')
    should contain_host('caporacledb.rpa.spec')
    should contain_host('caporacledb.rpa.spec')
    should contain_host('capweb.rpa.spec')
    should contain_host('capmanagement.rpa.spec')
    should contain_host('capapp.rpa.spec')
    should contain_host('capmonitoring.rpa.spec')
    should contain_host('capdbmaplinux.rpa.spec')
  end
end