require_relative '../../../../spec_helper.rb'

describe 'capdservices::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/14-capdservices.conf').
	    with_ensure('present')
    should contain_file('/etc/init/capdservices.conf').
	    with_ensure('present')
    should contain_file('/opt/capdservices').
	    with_ensure('directory')
    should contain_file('/opt/capdservices/servicesConfig.yml').
	    with_ensure('present').with_content(/192.168.99.111:80/).
        with_content(/enableOrganisationAmend: true/).with_content(/enableOrganisationCreate: true/).
        with_content(/enableParcelAdd: false/).with_content(/enableParcelRemove: false/).
        with_content(/from: noreply@kainos.com/).with_content(/tokenServiceUrl:/).with_content(/10.179.134.230:8111/).
        with_content(/errorPagePath\: "https:\/\/capd-spec.kainos.com\/start-login"/).
        with_content(/baseUrl: http:\/\/192.168.99.111:9003/).
        with_content(/port: 4685/).
        with_content(/adminPort: 4686/)
    should contain_file('/opt/capdservices/ida.crt').
	    with_ensure('present')
    should contain_file('/opt/capdservices/encryption.crt').
	    with_ensure('present')
    should contain_file('/opt/capdservices/encryption.pk8.der').
	    with_ensure('present')
    should contain_logrotate__file('capdservices').with(
      'log'        => '/var/log/capd/capdservices.log',
      'options'    =>
                ['notifempty',
                 'daily',
                 'rotate 14',
                ],
      'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    )
  end
end
