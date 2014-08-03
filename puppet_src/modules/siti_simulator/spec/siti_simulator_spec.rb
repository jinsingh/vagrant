require_relative '../../../spec_helper.rb'

describe 'siti_simulator', type: :class do
  it do
    should contain_package('nodejs').with('ensure'=>'installed',)
    should contain_package('npm').with('ensure'=>'installed',)
    should contain_package('libcurl-devel').with('ensure'=>'installed',)
    should contain_package('siti-simulator').with('ensure'=>'latest',)
    should contain_file('/usr/bin/forever').with('ensure'=>'link',)
    should contain_file('/opt/siti-simulator/conf.js').
      with('ensure'=>'present',).
      with_content(/sitiagri_host : "10.1.1.1"/)
    should contain_service('siti-simulator').with('ensure'=>'running')
    should contain_file('/opt/siti-simulator').
      with('mode'=>'0770').
      with('ensure'=>'directory')
  end
end
