require_relative '../../../../spec_helper.rb'

describe 'nginx::config', :type => :class do
  context 'default' do
     it do
      should contain_file('/etc/nginx/conf.d/nginx-lua.conf')
        .with_content(/location \/ida-register/)
        .with_content(/application\/x-navimap/)
        .with_content(/server 192.168.99.111:80/)
        .with_content(/server 10.140.1.2:9001/)
        .with_content(/server 10.140.1.3:9001/)
        .with_content(/server 192.168.99.111:8980/)
      should contain_file('/etc/rsyslog.d/32-nginx.conf')
      should contain_logrotate__file('nginx').with(
        'log'        => '/var/log/nginx/*log',
        'options'    =>
                ['daily',
                 'missingok',
                 'rotate 52',
                 'compress',
                 'delaycompress',
                 'notifempty',
                 'create 640 nginx adm',
                 'sharedscripts',
                ],
        'postrotate' => [' [ -f /var/run/nginx.pid ] && kill -USR1 `cat /var/run/nginx.pid` ',
                  '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
                  ],
        )
      should contain_file('/etc/nginx/conf.d/ida_private_beta_token_validation.lua')
        .with_ensure('present')
      should contain_file('/etc/nginx/conf.d/auth_content.lua').with_content(/https:\/\/capd-spec.kainos.com\/authorisationLandingPage/)
        .with_content(/https:\/\/capd-spec.kainos.com\/#\/ida-welcome/)
      end
   end

  context 'acceptance environment ' do
    let(:facts) {{ :fqdn => 'capweb.rpa.capaccept' }}
    it do
      should contain_file('/etc/nginx/conf.d/nginx-lua.conf').with_content(/Strict-Transport-Security max-age=31536000;/)
    end
  end

  context 'ida private beta environment' do
    it do
      should contain_file('/etc/nginx/conf.d/nginx-lua.conf').with_content(/access_by_lua_file '\/etc\/nginx\/conf.d\/ida_private_beta_token_validation.lua';/)
    end
  end
end
