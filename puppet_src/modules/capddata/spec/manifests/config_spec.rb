require_relative '../../../../spec_helper.rb'

describe 'capddata::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/26-capddata.conf').
      with_ensure('present')

    should contain_logrotate__file('capddata').with(
      'log'        => '/var/log/capd/capddata.log',
      'options'    =>
                ['notifempty',
                 'daily',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
    should contain_exec('capd_db_update').with(
      'refreshonly' => 'true',
      'path'        => '/usr/bin:/usr/sbin:/bin:/sbin',
      'command'     => 'bash -c "java -jar -Djob.properties=/opt/capddata/capddata.properties /opt/capddata/cap-db-assembly.jar 2>&1 | tee >(logger -t CAPDDATA -p daemon.info)"',
    )
    should contain_exec('capd_auth_db_update').with(
      'refreshonly' => 'true',
      'path'        => '/usr/bin:/usr/sbin:/bin:/sbin',
      'command'     => 'bash -c "java -jar -Djob.properties=/opt/capddata/capddata.properties /opt/capdinternaluserauthservices/capd-db-assembly-internet-user-auth.jar 2>&1 | tee >(logger -t CAPDDATA -p daemon.info)"',
    )
  end
end
