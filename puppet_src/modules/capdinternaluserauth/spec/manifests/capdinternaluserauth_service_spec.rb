require_relative '../../../../spec_helper.rb'

describe 'capdinternaluserauth::service', :type => :class do
  it do 
    should contain_service('capdinternaluserauth').with(
      'ensure'    => 'running',
      'hasstatus' => 'true',
      'restart'   => '/sbin/restart capdinternaluserauth',
      'start'     => '/sbin/start capdinternaluserauth',
      'stop'      => '/sbin/stop capdinternaluserauth',
      'status'    => '/sbin/status capdinternaluserauth | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
