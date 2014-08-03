require_relative '../../../../spec_helper.rb'

describe 'capdmatchingadapter::service', type: :class do
  it do
    should contain_service('capdmatchingadapter').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'restart' => '/sbin/restart capdmatchingadapter',
      'start' => '/sbin/start capdmatchingadapter',
      'stop' => '/sbin/stop capdmatchingadapter',
      'status' => '/sbin/status capdmatchingadapter | grep "/running" 1>/dev/null 2>&1',
    )
  end
end
