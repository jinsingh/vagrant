require_relative '../../../../spec_helper.rb'

describe 'capdtasks::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/22-capdtasks.conf').
      with_ensure('present')
    should contain_file('/opt/capdtasks/output/').
      with_ensure('directory')
    should contain_file('/opt/capdtasks/perfLoad1.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-1/)
    should contain_file('/opt/capdtasks/perfLoad2.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-2/)
    should contain_file('/opt/capdtasks/perfLoad3.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-3/)
    should contain_file('/opt/capdtasks/perfLoad4.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-4/)
    should contain_file('/opt/capdtasks/perfLoad5.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-5/)
    should contain_file('/opt/capdtasks/perfLoad6.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-6/)
    should contain_file('/opt/capdtasks/perfLoad7.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-7/)
    should contain_file('/opt/capdtasks/perfLoad8.properties').
      with_ensure('present').with_content(/job.input.directory=\/home\/deploy\/profile-8/)
    should contain_file('/opt/capdtasks/csvLoad.properties').
      with_ensure('present').with_content(/job.input.directory=\/opt\/capdtasks\/data\/dev/)
    should contain_file('/opt/capdtasks/acceptanceLoad.properties').
      with_ensure('present').with_content(/job.input.directory=\/opt\/capdtasks\/data\/acceptance_tests/)
    should contain_file('/opt/capdtasks/passcodeOnlyLoad.properties').
      with_ensure('present').with_content(/job.input.directory=\/opt\/capdtasks\/data\/passcode_only/)
    should contain_logrotate__file('capdtasks').with(
      'log'        => '/var/log/capd/capdtasks.log',
      'options'    =>
                ['notifempty',
                 'daily',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
    should contain_file('/opt/capdtasks/userOnlyLoad.properties').
      with_ensure('present').with_content(/job.input.directory=\/opt\/capdtasks\/data\/user_only/)
  end
end
