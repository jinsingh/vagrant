require_relative '../../../../spec_helper.rb'

describe 'rkhunter::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/20-rkhunter.conf').
      with_ensure('present')

    should contain_logrotate__file('rkhunter').with(
      'log'        => '/var/log/rkhunter.log',
      'options'    =>
                ['notifempty',
                 'weekly',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
  end
end
