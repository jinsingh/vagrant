require_relative '../../../../spec_helper.rb'

describe 'capdsitisqlldr::config', type: :class do
  it do
    should contain_file('/opt/capdsitisqlldr')
    should contain_file('/opt/capdsitisqlldr/bad')
    should contain_file('/opt/capdsitisqlldr/data')
    should contain_file('/opt/capdsitisqlldr/config')
    should contain_file('/opt/capdsitisqlldr/logs')
    should contain_file('/opt/capdsitisqlldr/sqlscripts')
    should contain_file('/opt/capdsitisqlldr/config/DbList')
    should contain_file('/etc/profile.d/oracle_home.sh')
    should contain_file('/usr/bin/sqlldr')
    should contain_exec('sqlldr_ldconfig')
  end
end

