require_relative '../../../../spec_helper.rb'

describe 'capdmatching::service', type: :class do
  it do
    should contain_service('capdmatching').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'restart' => '/sbin/restart capdmatching',
      'start' => '/sbin/start capdmatching',
      'stop' => '/sbin/stop capdmatching',
      'status' => '/sbin/status capdmatching | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
