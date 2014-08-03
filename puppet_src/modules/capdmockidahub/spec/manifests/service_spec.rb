require_relative '../../../../spec_helper.rb'

describe 'capdmockidahub::service', type: :class do
  it do
    should contain_service('capdmockidahub').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'restart' => '/sbin/restart capdmockidahub',
      'start' => '/sbin/start capdmockidahub',
      'stop' => '/sbin/stop capdmockidahub',
      'status' => '/sbin/status capdmockidahub | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
