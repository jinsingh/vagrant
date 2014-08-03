require_relative '../../../../spec_helper.rb'

describe 'capdmdmload::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/24-capdmdmload.conf')
    should contain_file('/opt/capdmdmload/')
    should contain_file('/opt/capdmdmload/mdmDataLoad-server.properties').
      with_content(/data\/server\/person.psv/).
      with_content(/192.168.99.111:4685/)
    should contain_file('/opt/capdmdmload/mdmDataLoad-storytesting.properties').
      with_content(/data\/story-testing\/person.psv/).
      with_content(/192.168.99.111:4685/)
    should contain_file('/opt/capdmdmload/mdmDataLoad-storytestingbasedata.properties').
      with_content(/data\/story-testing-base-data\/person.psv/).
      with_content(/192.168.99.111:4685/)
    should contain_logrotate__file('capdmdmload').with(
      'log'        => '/var/log/capd/capdmdmload.log',
      'options'    =>
                ['notifempty',
                 'weekly',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
  end
end
