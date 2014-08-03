require_relative '../../../../spec_helper.rb'

describe 'capdinternaluserauth::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/25-capdinternaluserauth.conf').
      with_ensure('present')
    should contain_file('/opt/capdinternaluserauthservices/')
    should contain_file('/opt/capdinternaluserauthservices/capdinternaluserauthConfig.yml').
      with_ensure('present').
      with_content(/capdUrl: https:\/\/capd-spec.kainos.com/)
    should contain_file('/etc/init/capdinternaluserauth.conf').
      with_ensure('present')
    should contain_logrotate__file('capdinternaluserauth').with(
      'log'        => '/var/log/capd/capdinternaluserauth.log',
      'options'    =>
                ['notifempty',
                 'weekly',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
  end
end
