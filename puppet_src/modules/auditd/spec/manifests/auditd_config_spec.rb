require_relative '../../../../spec_helper.rb'

describe 'auditd::config', type: :class do
  it do
    should contain_file('/etc/audit/auditd.conf')
    should contain_file('/etc/audit/audit.rules')
    should contain_file('/etc/audisp/plugins.d/syslog.conf')
    should contain_file('/etc/rsyslog.d/18-auditd.conf').with_ensure('present')
    should contain_logrotate__file('auditd').with(
      'log'        => '/var/log/audit/audit.log',
      'options'    =>
                ['notifempty',
                 'daily',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
  end
end
