require_relative '../../../../spec_helper.rb'

describe 'capdsitiserviceintegration::service', type: :class do
  it do
    should contain_service('capdsitiserviceintegration').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'restart' => '/sbin/restart capdsitiserviceintegration',
      'start' => '/sbin/start capdsitiserviceintegration',
      'stop' => '/sbin/stop capdsitiserviceintegration',
      'status' => '/sbin/status capdsitiserviceintegration | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
