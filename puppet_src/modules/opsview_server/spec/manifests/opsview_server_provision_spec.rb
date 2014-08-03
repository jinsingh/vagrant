require_relative '../../../../spec_helper.rb'

describe 'opsview_server::provision', :type => :class do
  it do
    should compile.with_all_deps
    should contain_opsview_monitored__('capmanagement.rpa.spec')
    should contain_opsview_monitored__('capservices.rpa.spec-10.179.133.214')
    should contain_opsview_monitored__('caporacledb.rpa.spec')
    should contain_opsview_monitored__('capapp.rpa.spec')
    should contain_opsview_monitored__('capweb.rpa.spec')
    should contain_opsview_monitored__('caphamaster.rpa.spec')
    should contain_opsview_monitored__('caphaslave.rpa.spec')
  end
end
