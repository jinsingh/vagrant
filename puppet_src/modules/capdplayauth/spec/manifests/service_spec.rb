require_relative '../../../../spec_helper.rb'

describe 'capdplayauth::service', type: :class do
  it do
    should contain_service('capdplayauth').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'restart' => '/sbin/restart capdplayauth',
      'start' => '/sbin/start capdplayauth',
      'stop' => '/sbin/stop capdplayauth',
      'status' => '/sbin/status capdplayauth | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
