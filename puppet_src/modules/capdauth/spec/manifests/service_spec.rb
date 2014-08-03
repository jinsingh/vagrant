require_relative '../../../../spec_helper.rb'

describe 'capdauth::service', type: :class do
  it do
    should contain_service('capdauth').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'restart' => '/sbin/restart capdauth',
      'start' => '/sbin/start capdauth',
      'stop' => '/sbin/stop capdauth',
      'status' => '/sbin/status capdauth | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
