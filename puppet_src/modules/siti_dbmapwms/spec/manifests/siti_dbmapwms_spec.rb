require_relative '../../../../spec_helper.rb'

describe 'siti_dbmapwms', :type => :class do
  it do
    should contain_package('capd-siti-dbmapwms').with(
      'ensure' => 'latest',
    )
    should contain_package('qt')
    should contain_package('qt-x11')
    should contain_package('gdm')
    should contain_file('/opt/siti-dbmapwms/conf/projects.ini').
      with_content(/opt\/siti-dbmapwms\/html\/prj\/cataloghi.xml/)
    should contain_file('/opt/siti-dbmapwms/conf/server.ini').
      with_content(/port=8080/)
    should contain_file('/opt/siti-dbmapwms/conf/stores.ini').
      with_content(/password=PLAIN:siti_pwd/)
    should contain_file('/etc/init.d/dbmapwms')
    should contain_file('/opt/siti-dbmapwms/start.sh').
      with_content(/export DISPLAY=:0/)
    should contain_service('dbmapwms').
      with(
        'ensure' => 'running',
        'enable' => 'true')
    should contain_file('/etc/inittab').
      with_content(/id:5:initdefault:/)
    should contain_file('/etc/init.d/xvfb')
    should contain_service('xvfb').
       with(
	 'ensure' => 'running',
	 'enable' => 'true')
  end
  it { should contain_rsyslog__imfile('34-siti_dbmapwms-out.conf').with('file_name' => '/opt/siti-dbmapwms/logs/out.log') }
  it { should contain_rsyslog__imfile('35-siti_dbmapwms-err.conf').with('file_name' => '/opt/siti-dbmapwms/logs/err.log') }
  it { should contain_logrotate__file('dbmapwms').with('log' => '/opt/siti-dbmapwms/logs/*.log') }
end


