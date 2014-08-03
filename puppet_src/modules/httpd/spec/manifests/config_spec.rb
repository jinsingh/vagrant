require_relative '../../../../spec_helper.rb'

describe 'httpd::config', type: :class do
  it do
    should contain_logrotate__file('httpd').with(
      'log'        => '/var/log/httpd/*log',
      'options'    =>
                ['missingok',
                 'notifempty',
                 'weekly',
                 'sharedscripts',
                 'delaycompress',
                 'rotate 14',
                ],
      'postrotate' => ['/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
                       '/sbin/service httpd reload > /dev/null 2>/dev/null || true'],
    )
  end
end
